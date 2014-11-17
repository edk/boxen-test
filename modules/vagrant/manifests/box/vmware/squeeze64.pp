# Public: Install a 64bit VMware Vagrant base box for Debian Squeeze

class vagrant::box::vmware::squeeze64 {
  vagrant::box { 'squeeze64/vmware_fusion':
    source => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
  }
}
