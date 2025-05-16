add-content -path c:/users/lawrence/.ssh/config -value @'

Host ${hostname} 
    HostName ${hostname}
    User ${user}
    IdentityFile ${identityfile}
'@