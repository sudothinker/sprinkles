package :security do
  requires :firewall, :secure_ssh
end

package :secure_ssh do
  noop do
    post :install, 'sed -i "s/^#*\(PermitRootLogin\).*/\1 no/" /etc/ssh/sshd_config'
    post :install, 'sed -i "s/^#*\(PasswordAuthentication\).*/\1 no/" /etc/ssh/sshd_config'
  end
end

package :lock_root do
  noop do
    # lock root user
    post :install, 'passwd -l "root"'
  end
end