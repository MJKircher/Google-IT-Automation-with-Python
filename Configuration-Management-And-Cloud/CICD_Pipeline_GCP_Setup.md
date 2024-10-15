# CI/CD Pipeline Using GCP

## Initialize The Lab

### In Cloud Shell, set your project ID and project number. Save them as PROJECT_ID and PROJECT_NUMBER variables:

export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
export REGION=us-east1
gcloud config set compute/region $REGION

### Run the following command to enable the APIs for GKE, Cloud Build, Cloud Source Repositories and Container Analysis:

gcloud services enable container.googleapis.com \
    cloudbuild.googleapis.com \
    sourcerepo.googleapis.com \
    containeranalysis.googleapis.com

### Create an Artifact Registry Docker repository named my-repository in the us-east1 region to store your container images:

gcloud artifacts repositories create my-repository \
  --repository-format=docker \
  --location=$REGION

### Create a GKE cluster to deploy the sample application of this lab:

gcloud container clusters create hello-cloudbuild --num-nodes 1 --region $REGION

## Create the Git Repositories

### In Cloud Shell, run the following to create the two Git repositories:

gcloud source repos create hello-cloudbuild-app
gcloud source repos create hello-cloudbuild-env

### Download the sample code from Cloud Storage:

cd ~
mkdir hello-cloudbuild-app
gcloud storage cp -r gs://gwg-content/gic225/gke-gitops-tutorial-cloudbuild/* hello-cloudbuild-app

### Configure Cloud Source Repositories as a remote:

cd ~/hello-cloudbuild-app
export REGION=us-east1
sed -i "s/us-central1/$REGION/g" cloudbuild.yaml
sed -i "s/us-central1/$REGION/g" cloudbuild-delivery.yaml
sed -i "s/us-central1/$REGION/g" cloudbuild-trigger-cd.yaml
sed -i "s/us-central1/$REGION/g" kubernetes.yaml.tpl
PROJECT_ID=$(gcloud config get-value project)
git init
git add .
git remote add google "https://source.developers.google.com/p/${PROJECT_ID}/r/hello-cloudbuild-app"
git commit -m "Initial commit"

### The code you just cloned contains a simple "Hello World" application.

from flask import Flask
app = Flask('hello-cloudbuild')
@app.route('/')
def hello():
  return "Hello World!\n"
if __name__ == '__main__':
  app.run(host = '0.0.0.0', port = 8080)

## Create a container image with Cloud Build

### In Cloud Shell, create a Cloud Build build based on the latest commit with the following command:

cd ~/hello-cloudbuild-app
COMMIT_ID="$(git rev-parse --short=7 HEAD)"
gcloud builds submit --tag="${REGION}-docker.pkg.dev/${PROJECT_ID}/my-repository/hello-cloudbuild:${COMMIT_ID}" .

## Create the Continuous Integration (CI) pipeline

In the Cloud console, go to Cloud Build > Triggers.
Click Create Trigger
In the Name field, type hello-cloudbuild.
Under Event, select Push to a branch.
Under Source, select hello-cloudbuild-app as your Repository and .* (any branch) as your Branch.
Under Build configuration, select Cloud Build configuration file.
In the Cloud Build configuration file location field, type cloudbuild.yaml after the /.
For the Service account, use the Compute Engine default service account.
Click Create.

### To start this trigger, run the following command:

cd ~/hello-cloudbuild-app
git add .
git commit -m "Test of Cloud Build Trigger"
git push google master

## Create the Test Environment and CD pipeline

### Grant Cloud Build access to GKE

PROJECT_NUMBER="$(gcloud projects describe ${PROJECT_ID} --format='get(projectNumber)')"
gcloud projects add-iam-policy-binding ${PROJECT_NUMBER} \
--member=serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com \
--role=roles/container.developer

### You need to initialize the hello-cloudbuild-env repository with two branches (production and candidate) and a Cloud Build configuration file describing the deployment process.

cd ~
gcloud source repos clone hello-cloudbuild-env
cd ~/hello-cloudbuild-env
git checkout -b production

### Next you need to copy the cloudbuild-delivery.yaml file available in the hello-cloudbuild-app repository and commit the change:

cp ~/hello-cloudbuild-app/cloudbuild-delivery.yaml ~/hello-cloudbuild-env/cloudbuild.yaml
git add .
git commit -m "Create cloudbuild.yaml for deployment"

### Create a candidate branch and push both branches for them to be available in Cloud Source Repositories:

git checkout -b candidate
git push origin production
git push origin candidate

### Grant the Source Repository Writer IAM role to the Cloud Build service account for the hello-cloudbuild-env repository:

PROJECT_NUMBER="$(gcloud projects describe ${PROJECT_ID} \
--format='get(projectNumber)')"
cat >/tmp/hello-cloudbuild-env-policy.yaml <<EOF
bindings:
- members:
  - serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com
  role: roles/source.writer
EOF

gcloud source repos set-iam-policy \
hello-cloudbuild-env /tmp/hello-cloudbuild-env-policy.yaml

## Create the trigger for the continuous delivery pipeline

In the Cloud console, go to Cloud Build > Triggers.
Click Create Trigger.
In the Name field, type hello-cloudbuild-deploy.
Under Event, select Push to a branch.
Under Source, select hello-cloudbuild-env as your Repository and ^candidate$ as your Branch.
Under Build configuration, select Cloud Build configuration file.
In the Cloud Build configuration file location field, type cloudbuild.yaml after the /.
For the Service account, use the Compute Engine default service account.
Click Create.

## Modify the continuous integration pipeline to trigger the continuous delivery pipeline.

### Copy the extended version of the cloudbuild.yaml file for the app repository:

cd ~/hello-cloudbuild-app
cp cloudbuild-trigger-cd.yaml cloudbuild.yaml

### Commit the modifications and push them to Cloud Source Repositories:

git add cloudbuild.yaml
git commit -m "Trigger CD pipeline"
git push google master

## Test the complete pipeline

### In Cloud Shell, replace "Hello World" with "Hello Cloud Build", both in the application and in the unit test:

sed -i 's/Hello World/Hello Cloud Build/g' app.py
sed -i 's/Hello World/Hello Cloud Build/g' test_app.py

### Commit and push the change to Cloud Source Repositories:

git add app.py test_app.py
git commit -m "Hello Cloud Build"
git push google master

## Test the rollback

In the Cloud console, go to Cloud Build > Dashboard.
Click on View all link under Build History for the hello-cloudbuild-env repository.
Click on the second most recent build available.
Click Rebuild.