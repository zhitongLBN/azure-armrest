$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require_relative '../lib/azure-armrest'
require 'pp'

conf = Azure::Armrest::ArmrestService.configure(
  :client_id       => ENV['AZURECLIENTID'],
  :client_key      => ENV['AZURECLIENTKEY'],
  :tenant_id       => ENV['AZURETENANTID'],
  :subscription_id => ENV['AZURESUBSCRIPTIONID'],
  :resource_group  => ENV['AZURERESOURCEGROUP']
)

vms = Azure::Armrest::VirtualMachineService.new(conf)
vm_model = vms.get('alavmdisks', conf.resource_group, true)

# pp vm_model
# pp vm_model.properties
# pp vm_model.os_disk
pp vm_model.data_disks
# pp vm_model.networks

# actions
# vm_model.start
# vm_model.stop
# vm_model.deallocate
