# Public: Install a 64bit VMware Vagrant base box for Debian Wheezy

class vagrant::box::vmware::wheezy64 {
  vagrant::box { 'wheezy64/vmware_fusion':
    source => 'https://s3.amazonaws.com/github-ops/vagrant/wheezy64-20130320-vmware_fusion.box'
  }
}
