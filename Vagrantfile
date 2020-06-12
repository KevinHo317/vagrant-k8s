# -*- mode: ruby -*-
# vi: set ft=ruby :
# Use config.yaml for basic VM configuration.

require 'yaml'
dir = File.dirname(File.expand_path(__FILE__))
config_nodes = "#{dir}/artefacts/config/config_multi-nodes.yaml"

if !File.exist?("#{config_nodes}")
  raise 'Configuration file is missing! Please make sure that the configuration exists and try again.'
end
vconfig = YAML::load_file("#{config_nodes}")

BRIDGE_NET = vconfig['vagrant_ip']
DOMAIN = vconfig['vagrant_domain_name']
RAM = vconfig['vagrant_memory']

servers=[
  {
    :hostname => "master01." + "#{DOMAIN}",
    :ip => "#{BRIDGE_NET}" + "110",
    :ram => 2048
  },
  {
    :hostname => "master02." + "#{DOMAIN}",
    :ip => "#{BRIDGE_NET}" + "111",
    :ram => 2048
  },
  {
    :hostname => "node01." + "#{DOMAIN}",
    :ip => "#{BRIDGE_NET}" + "112",
    :ram => 2048 
  },
  {
    :hostname => "node02." + "#{DOMAIN}",
    :ip => "#{BRIDGE_NET}" + "113",
    :ram => 2048 
  },
  {
    :hostname => "node03." + "#{DOMAIN}",
    :ip => "#{BRIDGE_NET}" + "114",
    :ram => 2048
  }
]
 
Vagrant.configure(2) do |config|
    config.vm.synced_folder ".", vconfig['vagrant_directory'], :mount_options => ["dmode=777", "fmode=666"]
    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
			      node.vm.box = vconfig['vagrant_box']
			      node.vm.box_version = vconfig['vagrant_box_version']
			      node.vm.hostname = machine[:hostname]
            node.vm.network "private_network", ip: machine[:ip] 
            node.vm.provider "virtualbox" do |vb|
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
			        	vb.cpus = vconfig['vagrant_cpu']
				        vb.memory = machine[:ram]
                vb.name = machine[:hostname]
            end
	      #config.vm.provision :shell, path: "#{dir}/artefacts/config/bootstrap.sh"
        end
    end
end
