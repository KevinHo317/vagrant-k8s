#!/binbash
      permitrootlogin=`grep "^PermitRootLogin" /etc/ssh/sshd_config`
      if [[ $permitrootlogin == "PermitRootLogin no" ]]
      then 
      isVulnerability="No"
      else
      isVulnerability="Yes"
      fi
      echo "Audit criteria: Root login via SSH are not allowed"
      echo "Vulnerability: $isVulnerability"
      echo "Details: See below"
      echo
      echo "Command:"
      echo "grep "^PermitRootLogin" /etc/ssh/sshd_config"
      echo
      echo "Output:"
      echo $permitrootlogin

      PasswordAuthentication=`grep "^PasswordAuthentication" /etc/ssh/sshd_config`
      if [[ $PasswordAuthentication == "PasswordAuthentication no" ]]
      then 
      isVulnerability="No"
      else
      isVulnerability="Yes"
      fi
      echo "Audit criteria: Password login via SSH are not allowed"
      echo "Vulnerability: $isVulnerability"
      echo "Details: See below"
      echo
      echo "Command:"
      echo "grep "^PasswordAuthentication" /etc/ssh/sshd_config"
      echo
      echo "Output:"
      echo $PasswordAuthentication