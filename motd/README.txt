# motd generator file

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!! using this generato will rewrite your current motd !!!
!!! if you care about it back it up first              !!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

first copy the generator file in the bin folder
> # cp gen_motd.sh /bin/

give it the right permissons
> # chmod 0755 /bin/gen_motd.sh

set the owner as root
> # chown root:root /bin/gen_motd.sh

add the following line to the '/etc/pam.d/system-login' before line 1
0+| session    optional   pam_exec.so	   /bin/gen_motd.sh
1 | session    optional   pam_motd.so

file shamelessy forked from https://github.com/jrmileham/arch-motd/tree/master

