package :make_users do
  $users.each do |user|
    username = user[0]
    pub_key = user[1]

    runner "useradd --create-home --shell '/bin/bash' --user-group --groups 'sudo' '#{username}'"
    # runner '"#{username}:#{password}" | chpasswd'    
    
    user_home = "/home/#{username}"
    
    runner "sudo -u '#{username}' mkdir '#{user_home}/.ssh'"
    runner "sudo -u '#{username}' touch '#{user_home}/.ssh/authorized_keys'"
    runner "sudo -u '#{username}' echo '#{pub_key}' >> '#{user_home}/.ssh/authorized_keys'"
    runner "chmod 0600 '#{user_home}/.ssh/authorized_keys'"

    runner "mkdir -p /var/www"
  end

  runner "chown deploy:deploy /var/www"

  verify do
    $users.each do |user|
      has_directory "/home/#{user[0]}"
    end
  end

end