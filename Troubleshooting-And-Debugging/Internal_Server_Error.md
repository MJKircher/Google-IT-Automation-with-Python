# Internal Server Error Problem. Linux Command Workflow

- Ssh Webserver
- Cd /var/log/
- Ls -lt | head
- Tail syslog
- Sudo netstat -nlp | grep :80    <-n to print numerical addresses instead of hostnames. -l to only - - check sockets that are listening. -p print process ID and name which each socket belongs. Pipe to grep only port 80
- Ls -l /etc/nginx/sites-enabled/
- Vim /etc/nginx/sites-enabled/site.example.com.conf
- Ls -l /etc/uwsgi/apps-enabled/
- vim /etc/uwsgi/apps-enabled/site.example.com.ini    find where log file is stored
- Sudo vim /srv/site.example.com/prod.py
- Add debugging info
- Sudo service uwsgi reload
- Refresh website to see debug info
- Ls -l site*     check if any other files start with site
- Application couldn’t read/write to this log file because it belongs to root user
- Sudo chown www-data.www-data site.log     Change the owner of site.log file
