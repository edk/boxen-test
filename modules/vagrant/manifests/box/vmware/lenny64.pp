# Public: Install a 64bit VMware Vagrant base box for Debian Lenny

class vagrant::box::vmware::lenny64 {
  vagrant::box { 'lenny64/vmware_fusion':
    source => 'https://s3.amazonaws.com/github-ops/vagrant/lenny64-5.0.10-vmware_fusion.box'
  }
}
