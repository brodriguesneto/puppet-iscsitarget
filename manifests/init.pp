# Class: iscsitarget
class iscsitarget ($ensure = 'present', $autoupgrade = false,) inherits iscsitarget::params {
  case $ensure {
    /(present)/ : {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/  : {
      $package_ensure = 'absent'
    }
    default     : {
      fail('ensure parameter must be present or absent')
    }
  }
  include iscsitarget::install, iscsitarget::config, iscsitarget::service
  Class['iscsitarget::install'] -> Class['iscsitarget::config'] ~> Class['iscsitarget::service']
}
