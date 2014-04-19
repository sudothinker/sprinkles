package :hostname do
  runner "echo #{HOST_NAME} > /etc/hostname"
  runner "hostname -F /etc/hostname"
  runner "echo -e '\n127.0.0.1 #{HOST_NAME} #{HOST_NAME}.local\n' >> /etc/hosts"
end
  