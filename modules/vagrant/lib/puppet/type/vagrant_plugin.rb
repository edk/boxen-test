Puppet::Type.newtype(:vagrant_plugin) do
  ensurable do
    newvalue :present do
      provider.create
    end

    newvalue :absent do
      provider.destroy
    end

    aliasvalue :installed, :present
    aliasvalue :uninstalled, :absent

    defaultto :present
  end

  newparam :name do
    isnamevar

    validate do |value|
      unless value =~ /\Avagrant-\w+(-\w+)*\z/
        raise Puppet::Error, "Invalid value for name: #{value}"
      end
    end
  end

  newparam :version

  autorequire :package do
    %w(Vagrant_1_4_2 vagrant)
  end

  autorequire :file do
    %W(
    /Users/#{Facter[:boxen_user].value}/.vagrant.d/license-#{self[:name]}.lic
    )
  end
end
