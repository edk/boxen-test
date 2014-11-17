require 'puppet/util/execution'

Puppet::Type.type(:vagrant_box).provide :vagrant_box do
  include Puppet::Util::Execution

  def create
    name, vprovider = @resource[:name].split('/')

    args = [
      "box",
      "add",
      name,
      @resource[:source],
      "--provider",
      vprovider
    ]

    args << "--force" if @resource[:force]

    vagrant(*args)
  end

  def destroy
    name, vprovider = @resource[:name].split('/')

    vagrant "box", "remove", name, "--provider", vprovider
  end

  def exists?
    if @resource[:force]
      false
    else
      name, vprovider = @resource[:name].split('/')

      boxes = vagrant "box", "list"
      boxes =~ /^#{name}\s+\(#{vprovider}(, .+)?\)/
    end
  end

  private
  def custom_environment
    {
      "HOME"         => "/Users/#{Facter[:boxen_user].value}",
      "VAGRANT_HOME" => "/Users/#{Facter[:boxen_user].value}/.vagrant.d",
    }
  end

  def opts
    {
      :combine            => true,
      :custom_environment => custom_environment,
      :failonfail         => true,
      :uid                => Facter[:boxen_user].value,
    }
  end

  def vagrant(*args)
    cmd = ["/usr/bin/vagrant"] + args
    execute cmd, opts
  end
end
