locals {
  const = {
    connectivity = {
      virtual_wan        = "virtual_wan"
      hub_and_spoke_vnet = "hub_and_spoke_vnet"
      none               = "none"
    }
  }
}

locals {
  connectivity_enabled                    = var.connectivity_type != local.const.connectivity.none
  connectivity_virtual_wan_enabled        = false
  connectivity_hub_and_spoke_vnet_enabled = true
}

locals {
  management_groups_enabled    = false
  management_resources_enabled = false
}

# Build an implicit dependency on the resource groups
locals {
  resource_groups = {
    resource_groups = module.resource_groups
  }
  hub_and_spoke_vnet_settings         = merge(module.config.hub_and_spoke_vnet_settings, local.resource_groups)
  hub_and_spoke_vnet_virtual_networks = (merge({ vnets = module.config.hub_and_spoke_vnet_virtual_networks }, local.resource_groups)).vnets
}

