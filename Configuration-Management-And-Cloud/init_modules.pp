class machine_info {
   file { '/tmp/machine_info.txt':
       content => template('machine_info/info.erb'),
   }
   if $facts[kernel] == "windows" {
       $info_path = "C:\Windows\Temp\Machine_Info.txt"
   } else {
       $info_path = "/tmp/machine_info.txt"
   }
}