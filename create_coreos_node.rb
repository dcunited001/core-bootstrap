Bundler.require
require 'yaml'
require 'ostruct'

create_coreos_cmd = File.read('./create-coreos-with-do-api.sh.erb')
erb = Erubis::Eruby.new(create_coreos_cmd)

node_name = ENV['COREOS_NODE']
raise 'COREOS_NODE must be set' unless node_name

node = OpenStruct.new(YAML.load_file('./coreos_nodes.yml')[node_name])
cluster = OpenStruct.new(YAML.load_file('./coreos_cluster.yml'))

digio_api_cmd = erb.result(binding())
puts digio_api_cmd

if ENV['COREOS_EXEC'] then
  if Kernel.system(digio_api_cmd)
  	'====[ Curl Successful ]===='
  else
  	'XX==[ Error on Curl! ]==XX'
  end
end
