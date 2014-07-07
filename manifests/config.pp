class iscsitarget::config {
  File {
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
  }

  file { $iscsitarget::params::iscsitarget_ietd:
    mode    => '0600',
    content => template("${module_name}/ietd.conf.erb"),
    require => Package[$iscsitarget::params::package],
    notify  => Service[$iscsitarget::params::service],
  }

  file { $iscsitarget::params::iscsitarget_default:
    mode    => '0644',
    source  => "puppet:///modules/${module_name}/iscsitarget",
    require => Package[$iscsitarget::params::package],
    notify  => Service[$iscsitarget::params::service],
  }

  file { $iscsitarget::params::apci_powerbtn:
    mode    => '0755',
    source  => "puppet:///modules/${module_name}/powerbtn.sh",
    require => Package[$iscsitarget::params::package],
    notify  => Service[$iscsitarget::params::service],
  }

  file { $iscsitarget::params::init_ctrl_alt_del:
    mode    => '0644',
    source  => "puppet:///modules/${module_name}/control-alt-delete.conf",
    require => Package[$iscsitarget::params::package],
    notify  => Service[$iscsitarget::params::service],
  }
}
