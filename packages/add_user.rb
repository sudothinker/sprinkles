package :add_user do
  $users.each do |user|
    username = user[0]
    password = user[1]
    pub_key = user[2]

    noop do
      pre :install, 'useradd --create-home --shell "/bin/bash" --user-group --groups "sudo" "#{username}"'
      pre :install, '"#{username}:#{password}" | chpasswd'    
      
      user_home ="/home/#{username}"
      pub_key = ''
      
      pre :install, 'sudo -u "#{username}" mkdir "#{user_home}/.ssh"'
      pre :install, 'sudo -u "#{username}" touch "#{user_home}/.ssh/authorized_keys"'
      pre :install, 'sudo -u "#{username}" echo "#{pub_key}" >> "#{user_home}/.ssh/authorized_keys"'
      pre :install, 'chmod 0600 "#{user_home}/.ssh/authorized_keys"'
    end
  end

  verify do
    $users.each do |user|
      has_directory "/home/#{user[0]}"
    end
  end

end

package :make_users do
  requires :add_user
end