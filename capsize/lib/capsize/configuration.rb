#--
# Capsize : A Capistrano Plugin which provides access to the amazon-ec2 gem's methods
#
# Ruby Gem Name::  capsize
# Author::    Glenn Rempe  (mailto:grempe@rubyforge.org)
# Author::    Jesse Newland  (mailto:jnewland@gmail.com)
# Copyright:: Copyright (c) 2007 Glenn Rempe, Jesse Newland
# License::   Distributes under the same terms as Ruby
# Home::      http://amazon-ec2-cap.rubyforge.org
#++

Capistrano::Configuration.instance.load do
  
  # Set reasonable defaults for all needed values so in theory this Cap plugin
  # will work out-of-the-box with no external config required.
  
  # capsize_config_dir is relative to the location they are running cap from (e.g. RAILS_ROOT)
  set :capsize_config_dir, 'config/capsize'
  set :capsize_secure_config_dir, 'config/capsize'
  
  set :capsize_config_file_name, 'capsize.yml'
  set :capsize_secure_config_file_name, 'secure.yml'
  
  # Where are the various extra capsize files stored?  Make them easy to get() or override
  set :capsize_examples_dir, "#{File.join(File.dirname(__FILE__), '/../../examples')}"
  set :capsize_bin_dir, "#{File.join(File.dirname(__FILE__), '/../../bin')}"
  
  
  #set :aws_startup_delay, 60
  
  # Determine where we will deploy to.  if TARGET is not specified 
  # then setup for production by default
  # TODO : CHANGE THIS TO TARGET_ENV IN HERE AND AMAZON-EC2
  set :deploy_env, ENV['TARGET'] ||= "production"
  
  set :group_name, 'default'
  set :ip_protocol, 'tcp'
  set :from_port, nil
  set :to_port, nil
  set :cidr_ip, '0.0.0.0/0'
  set :source_security_group_name, nil
  set :source_security_group_owner_id, nil
  
  set :image_id, nil
  set :min_count, 1
  set :max_count, 1
  set :key_name, nil
  set :user_data, nil
  set :addressing_type, 'public'
  
  
end