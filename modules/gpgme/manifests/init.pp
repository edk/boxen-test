# Public: Install gpgme from homebrew.
#
# Examples
#
#   include gpgme
class gpgme {
  package { 'gpgme':
    ensure => latest
  }
}
