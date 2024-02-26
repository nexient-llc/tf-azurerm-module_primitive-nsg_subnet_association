locals {
  nsg_name            = module.resource_names["network_security_group"].standard
  resource_group_name = module.resource_names["resource_group"].standard

  override_network_attributes_map = { for vnet_name, vnet in var.network_map : vnet_name => {
    resource_group_name = local.resource_group_name
    vnet_name           = module.resource_names["spoke_vnet"].standard
    location            = var.region
    }
  }

  modified_network_map = {
    for vnet_name, vnet in var.network_map : vnet_name => merge(vnet, local.override_network_attributes_map[vnet_name])
  }
}
