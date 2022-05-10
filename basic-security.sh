#!/bin/bash
PS3="Security and network checking tool. Plese enter your choice: "
select ITEM in "Check Cron user" "Check cron job" "check auth logs" "block ip using iptables" "check network logs" "delete user" "scan malware" "checking ssh logs" "check whether ip is blocked" "Kill all user process" "Check process run by user" "Check fail2ban logs" "Update and show fail2ban status"  "quit"
do
if [[ $REPLY -eq 1 ]]
then
read -p "enter user": user
sudo crontab -l -u $user

elif [[ $REPLY -eq 2  ]]
then
sudo crontab -l

elif [[ $REPLY -eq 3 ]]
then
sudo cat /var/log/auth.log

elif [[ $REPLY -eq 4 ]]
then
read -p "Enter IP to block": ip
echo "dropped ips from $ip"
sudo iptables -I INPUT -s $ip -j DROP


elif [[ $REPLY -eq 5 ]]
then
sudo netstat -tupan

elif [[ $REPLY -eq 6 ]]
then
read -p "Enter user to delete": $us
sudo deluser $us
echo "user deleted"

elif [[ $REPLY -eq 7 ]]
then
echo "Starting scan for malware"
sudo apt install rkhunter
sudo rkhunter --checkall

elif [[ $REPLY -eq 8 ]]
then
echo "Checking ssh logs"
sudo grep sshd.\*Failed /var/log/auth.log | less
sudo grep sshd.*Did /var/log/auth.log | less

elif [[ $REPLY -eq 9 ]]
then
echo "Displaying Tables"
sudo iptables -vnL

elif [[ $REPLY -eq 10 ]]
then
read -p "Enter user: " usa
sudo pkill -u $usa
echo "Killed all processes"

elif [[ $REPLY -eq 11 ]]
then
read -p "Enter username to check:" gign
sudo ps -f -U $gign

elif [[ $REPLY -eq 12 ]]
then
echo "Checking logs ...."
sudo cat /var/log/fail2ban.log

elif [[ $REPLY -eq 13 ]]
then
sudo apt install fail2ban
echo "Showing status"
sudo systemctl status fail2ban

elif [[ $REPLY -eq 14 ]]
then
echo "quit"
sleep 1
exit

else
echo "invalid"

fi
done
