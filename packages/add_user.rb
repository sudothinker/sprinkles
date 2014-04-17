package :add_user do
  $users.each do |user, password|
    noop do
      pre :install, 'useradd --create-home --shell "/bin/bash" --user-group --groups "sudo" "#{user}"'
      pre :install, '"#{user}:#{password}" | chpasswd'    
      
      user_home ="/home/#{user}"
      pub_key = ''
      
      pre :install, 'sudo -u "#{user}" mkdir "#{user_home}/.ssh"'
      pre :install, 'sudo -u "#{user}" touch "#{user_home}/.ssh/authorized_keys"'
      pre :install, 'sudo -u "#{user}" echo "#{pub_key}" >> "#{user_home}/.ssh/authorized_keys"'
      pre :install, 'chmod 0600 "#{user_home}/.ssh/authorized_keys"'
    end
  end

  verify do
    $users.each do |user, password|
      has_file "/home/#{user}/.ssh/authorized_keys"
    end
  end

end

package :make_users do
  requires :add_user
end