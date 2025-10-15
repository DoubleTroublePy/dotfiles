#!/bin/bash

# script must be run as root
if [[ $(whoami) != "root" ]]; then
  echo "script must be run as root"
  exit
fi

cp gen_motd.sh /bin/
chmod 0755 /bin/gen_motd.sh
chown root:root /bin/gen_motd.sh
echo -n 'session    optional   pam_exec.so	   /bin/gen_motd.sh' >> /etc/pam.d/system-login
echo "
  move the following line before line 1 
  0+| session    optional   pam_exec.so	   /bin/gen_motd.sh 
  1 | session    optional   pam_motd.so 
  the line is already at the end of the file
"
read -p "... press enter to continue ..."
vim /etc/pam.d/system-login

