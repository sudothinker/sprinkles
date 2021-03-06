package :postfix do
  # Installs postfix and configure to listen only on the local interface. Also
  # allows for local mail delivery
  runner 'echo "postfix postfix/main_mailer_type select Internet Site" | debconf-set-selections'
  runner 'echo "postfix postfix/mailname string localhost" | debconf-set-selections'
  runner 'echo "postfix postfix/destinations string localhost.localdomain, localhost" | debconf-set-selections'
  runner 'aptitude -y install postfix'
  runner '/usr/sbin/postconf -e "inet_interfaces = loopback-only"'
    #/usr/sbin/postconf -e "local_transport = error:local delivery is disabled"
  runner '/etc/init.d/postfix restart'
end