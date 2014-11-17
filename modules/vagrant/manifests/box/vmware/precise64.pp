# Public: Install a 64bit VMware Vagrant base box for Ubuntu Precise

class vagrant::box::vmware::precise64 {
  vagrant::box { 'precise64/vmware_fusion':
    source => 'http://files.vagrantup.com/precise64_vmware_fusion.box'
  }
}
