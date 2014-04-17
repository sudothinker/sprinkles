package :postfix do
  # Installs postfix and configure to listen only on the local interface. Also
  # allows for local mail delivery
  noop do
    pre :install, 'echo "postfix postfix/main_mailer_type select Internet Site" | debconf-set-selections'
    pre :install, 'echo "postfix postfix/mailname string localhost" | debconf-set-selections'
    pre :install, 'echo "postfix postfix/destinations string localhost.localdomain, localhost" | debconf-set-selections'
    pre :install, 'aptitude -y install postfix'
    pre :install, '/usr/sbin/postconf -e "inet_interfaces = loopback-only"'
    #/usr/sbin/postconf -e "local_transport = error:local delivery is disabled"
    post :install, '/etc/init.d/postfix restart'
  end
end