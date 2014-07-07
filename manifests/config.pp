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
}
