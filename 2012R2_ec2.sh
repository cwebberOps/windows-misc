#!/bin/bash

AMI=ami-9ade1df2
OS=Win2012R2
JSON='{"chef-client": { "task": { "frequency_modifier": 15 }}}'

echo "Start $(date)"
knife ec2 server create --image $AMI --flavor m1.small -g sg-13f69876 --user-data $HOME/projects/windows/windows-instance-data-winrm.ps1 -x chef -P 'chef' -r 'recipe[windows],recipe[chef-client::task]' -j '{"chef-client": { "task": { "frequency_modifier": 15 }}}'
echo "End $(date)"

/usr/local/bin/terminal-notifier -title 'An Windows' -message "${OS} is done"
