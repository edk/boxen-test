# Public: Install screen via homebrew
#
# Examples
#
#   include screen
class screen {
  include homebrew

  homebrew::formula { 'screen':
    before => Package['boxen/brews/screen'],
  }

  package { 'boxen/brews/screen':
    ensure => '4.00.03-boxen1'
  }
}
