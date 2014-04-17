# Special package, anything that defines a 'source' package means build-essential should be installed for Ubuntu

package :build_essential do
  description 'Build tools'
  apt 'build-essential' do
    pre :install, 'apt-get update'
    post :install, 'apt-get -y install aptitude'
    post :install, 'aptitude -y full-upgrade'
    post :install, 'aptitude -y install htop iotop bsd-mailx python-software-properties zsh'
    post :install, 'aptitude -y install build-essential gcc'
  end

  apt 'bash' do
    # Make sure we are running a Bash shell
    post :install, 'ln -sf /bin/bash /bin/sh'
  end

  verify do
    has_executable 'gcc'
    has_executable 'g++'
    has_executable '/bin/bash'
    has_symlink    '/bin/sh', '/bin/bash'
  end
end