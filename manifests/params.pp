class iscsitarget::params {
  case $::operatingsystem {
    'Ubuntu' : {
      case $::lsbdistrelease {
        /(12.04|14.04)/ : {
          $package              = 'iscsitarget'
          $packages_extra       = ['iscsitarget-dkms', 'dkms', 'make', 'acpid']
          $service              = 'iscsitarget'
          $iscsitarget_default  = '/etc/default/iscsitarget'
          $iscsitarget_ietd     = '/etc/iet/ietd.conf'
          $apci_powerbtn        = '/etc/acpi/powerbtn.sh'
          $init_ctrl_alt_del    = '/etc/init/control-alt-delete.conf'
          $iscsitarget_user     = 'user'
          $iscsitarget_password = 'password'
          $iscsitarget_path     = '/dev/sdb1'
          $iscsitarget_type     = 'blockio'
        }
        default         : {
          case $::lsbdistrelease {
            default : { fail("Unsupported Ubuntu suite: ${::lsbdistrelease}") }
          }
        }
      }
    }
    default  : {
      case $::operatingsystem {
        default : { fail("Unsupported operating system: ${::operatingsystem}") }
      }
    }
  }
}
