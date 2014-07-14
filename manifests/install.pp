# Class: install
class iscsitarget::install {
  package { [$iscsitarget::params::package, $iscsitarget::params::packages_extra]: ensure => $iscsitarget::package_ensure }
}
