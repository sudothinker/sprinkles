package :security do
  requires :firewall, :secure_ssh
end

package :secure_ssh do
  runner 'sed -i "s/^#*\(PermitRootLogin\).*/\1 no/" /etc/ssh/sshd_config'
  runner 'sed -i "s/^#*\(PasswordAuthentication\).*/\1 no/" /etc/ssh/sshd_config'
end

package :lock_root do
  # lock root user
  runner 'passwd -l "root"'
end
