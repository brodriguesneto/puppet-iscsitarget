class iscsitarget::service {
  service { $iscsitarget::params::service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['iscsitarget::config'],
  }
}
