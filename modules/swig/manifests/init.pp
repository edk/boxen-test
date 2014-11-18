# Public: Install swig via homebrew
#
# Examples
#
#   include swig
class swig {
  include pcre

  package { 'swig':
    require => Package['pcre']
  }
}
