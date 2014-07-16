# Class: params
class iscsitarget::params {
  case $::operatingsystem {
    'Ubuntu' : {
      case $::lsbdistrelease {
        /(12.04|14.04)/ : {
          $package              = 'iscsitarget'
          $packages_extra       = ['iscsitarget-dkms', 'acpid']
          $service              = 'iscsitarget'
          $iscsitarget_default  = '/etc/default/iscsitarget'
          $iscsitarget_ietd     = '/etc/iet/ietd.conf'
          $iscsitarget_user     = 'user'
          $iscsitarget_password = 'password'
          $iscsitarget_path     = '/dev/sdb1'
          $iscsitarget_type     = 'blockio'
          $acpid_powerbtn       = '/etc/acpi/powerbtn.sh'
          $ctrl_alt_del_init    = '/etc/init/control-alt-delete.conf'
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
