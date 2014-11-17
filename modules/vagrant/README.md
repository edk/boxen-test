# Vagrant Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-vagrant.png?branch=master)](https://travis-ci.org/boxen/puppet-vagrant)

Install [Vagrant](http://www.vagrantup.com/) on your Mac.

*Changes in release 3.0 and above: Vagrant will be upgraded when you change the version of this module in your Puppetfile*

## Usage

```puppet
class { 'vagrant': }
```
By default, the module will install Vagrant 1.6.3. You can specify a different version of Vagrant to install (minimum version is 1.4.0 due to download locations). To install Vagrant 1.4.0, you would specify the version as follows:

```puppet
class { 'vagrant':
  version => '1.4.0'
}
```

Plugins
--
To install a plugin, the usage would look as follows:

```puppet
vagrant::plugin { 'vagrant-vmware-fusion':
  license => 'puppet:///modules/people/joe/licenses/fusion.lic',
}
```

By default, the module will install the latest version of plugin. This behaviour can be overridden with the version paramter. The usage would look as follows:

```puppet
vagrant::plugin { 'vagrant-berkshelf':
  version => '2.0.1'
}
```

Boxes
--

To install a box, the usage would look as follows:

```puppet
vagrant::box { 'squeeze64/vmware_fusion':
  source => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
}
```

Bash Completion
--

[Bash](https://www.gnu.org/software/bash/) supports tab-completion for commands, _i.e._ you can type part of a command, then press Tab, and Bash will attempt to determine what command you have begun typing and then complete the command for you.  By default, Bash can only complete commands by searching `$PATH`; to enable completion for commands that have subcommands (like `vagrant`), you need to add additional Bash configuration.

To install this configuration automatically, invoke this class as follows:

```puppet
class { 'vagrant':
  completion => true,
}
```

This will install a [Homebrew](http://brew.sh/) package that provides the necessary configuration.  Once you have done so, **RESTART YOUR SHELL**, and then you'll be able to do something like the following:

```console
$ vagrant <TAB><TAB>
box            docker-run     init           plugin         resume         ssh            up
connect        global-status  list-commands  provision      rsync          ssh-config     version
destroy        halt           login          rdp            rsync-auto     status
docker-logs    help           package        reload         share          suspend
$ vagrant bo<TAB>
$ vagrant box <TAB><TAB>
add        help       list       remove     repackage
$ vagrant box li<TAB>
$ vagrant box list <RETURN>
puppetlabs/centos-6.5-64-puppet (vmware_desktop, 0.2.0)
$
```

## Required Puppet Modules

* `boxen`
* `homebrew`
* `repository`
* `stdlib`
