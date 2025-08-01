module "config" {
  source = "../modules/config-templating"

  enable_telemetry = var.enable_telemetry

  starter_locations               = var.starter_locations
  subscription_id_connectivity    = var.subscription_id_connectivity
  subscription_id_identity        = var.subscription_id_identity
  subscription_id_management      = var.subscription_id_management
  root_parent_management_group_id = var.root_parent_management_group_id

  custom_replacements = var.custom_replacements

  connectivity_resource_groups        = var.connectivity_resource_groups
  hub_and_spoke_vnet_settings         = var.hub_and_spoke_vnet_settings
  hub_and_spoke_vnet_virtual_networks = var.hub_and_spoke_vnet_virtual_networks
  tags                                = var.tags
}
