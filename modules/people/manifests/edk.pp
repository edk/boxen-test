
class people::edk {
  include phantomjs

  boxen::project { 'rails_app':
    ruby   => '2.1.2',
    mysql  => true,
    redis  => true,
    nginx  => true,
    source => 'coupa/coupa_development'
  }
}

