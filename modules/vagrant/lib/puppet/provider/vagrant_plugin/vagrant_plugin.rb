require 'json'
require 'puppet/util/execution'

Puppet::Type.type(:vagrant_plugin).provide :vagrant_plugin do
  include Puppet::Util::Execution

  def self.fetch_plugin_json
    plugins = "/Users/#{Facter[:boxen_user].value}/.vagrant.d/plugins.json"

    if File.exist? plugins
      json = JSON.parse IO.read(plugins)

      if json.has_key? "installed"
        return json["installed"]
      end
    end

    []
  end

  def self.installed_plugins
    @installed_plugins ||= fetch_plugin_json
  end


  def create
    cmd = [
      "/usr/bin/vagrant",
      "plugin",
      "install",
      @resource[:name]
    ]

    cmd << '--plugin-version' << @resource[:version] unless @resource[:version] == 'latest'

    execute cmd, opts
  end

  def destroy
    cmd = [
      "/usr/bin/vagrant",
      "plugin",
      "uninstall",
      @resource[:name]
    ]

    execute cmd, opts
  end

  def exists?
    self.class.installed_plugins.member? @resource[:name]
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
      :custom_environment => custom_environment,
      :failonfail         => true,
      :uid                => Facter[:boxen_user].value,
    }
  end
end
