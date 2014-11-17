# Public: Install graphviz from homebrew.
#
# Examples
#
#   include graphviz
class graphviz {
  require pkgconfig
  require swig

  package { 'graphviz':
    require => [
      Package['swig'],
      Package['pkg-config']
    ]
  }
}
