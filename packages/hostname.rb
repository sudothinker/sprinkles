package :hostname do
  noop do
    pre :install, 'echo #{HOST_NAME} > /etc/hostname'
    pre :install, 'hostname -F /etc/hostname'
    pre :install, 'echo -e "\n127.0.0.1 #{HOST_NAME} #{HOST_NAME}.local\n" >> /etc/hosts'
  end
end
  