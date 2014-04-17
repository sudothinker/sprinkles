package :firewall do
  description "Firewall security"

  noop do
    pre :install, 'aptitude -y install logcheck logcheck-database'
    pre :install, 'aptitude -y install fail2ban'
    # see https://help.ubuntu.com/community/UFW
    post :install, 'ufw logging on'
    post :install, 'ufw default deny'
    post :install, 'ufw allow ssh/tcp'
    post :install, 'ufw limit ssh/tcp'
    post :install, 'ufw allow http/tcp'
    post :install, 'ufw allow http/tcp'
    post :install, 'ufw allow https/tcp'
    post :install, 'ufw enable'
  end
end