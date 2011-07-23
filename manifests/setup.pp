# This class will ensure SSH is setup, configured and running.
class sshd::setup {
  $sshpackage = $operatingsystem ? {
    Debian => 'openssh-server',
    Ubuntu => 'openssh-server',
    default => 'openssh',
  }

  $sshservice = $operatingsystem ? {
    Debian => 'ssh',
    Ubuntu => 'ssh',
    default => 'sshd',
  }

  package { $sshpackage:
    ensure => installed,
    alias => 'openssh',
  }

  service { $sshservice:
    enable => true,
    ensure => running,
    hasrestart => true,
    hasstatus => true,
    require => Package[openssh],
  }	
}
