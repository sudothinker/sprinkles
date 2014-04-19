package :firewall do
  description "Firewall security"

  runner 'aptitude -y install logcheck logcheck-database'
  runner 'aptitude -y install fail2ban'
  # see https://help.ubuntu.com/community/UFW
  runner 'ufw logging on'
  runner 'ufw default deny'
  runner 'ufw allow ssh/tcp'
  runner 'ufw limit ssh/tcp'
  runner 'ufw allow http/tcp'
  runner 'ufw allow http/tcp'
  runner 'ufw allow https/tcp'
end

package :enable_firewall do
  runner 'ufw enable'
end