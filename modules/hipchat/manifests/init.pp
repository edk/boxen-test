# Public: Install HipChat.app into /Applications.
#
# Examples
#
#   include hipchat
class hipchat {
  package { 'HipChat':
    provider => 'compressed_app',
    source   => 'https://www.hipchat.com/downloads/latest/mac',
    flavor   => 'zip',
  }
}
