# Class: config
class iscsitarget::config {
  File {
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package[$iscsitarget::params::package],
    notify  => Service[$iscsitarget::params::service],
  }

  file { $iscsitarget::params::iscsitarget_default:
    source  => "puppet:///modules/${module_name}/iscsitarget.default",
  }

  file { $iscsitarget::params::ctrl_alt_del_init:
    source  => "puppet:///modules/${module_name}/control-alt-delete.conf.init",
  }

  file { $iscsitarget::params::iscsitarget_ietd:
    mode    => '0600',
    content => template("${module_name}/ietd.conf.erb"),
  }

  file { $iscsitarget::params::acpid_powerbtn:
    mode    => '0755',
    source  => "puppet:///modules/${module_name}/${::lsbdistcodename}.powerbtn.sh",
  }
}
