module "config" {
  source = "../modules/config-templating"

  enable_telemetry = var.enable_telemetry

  starter_locations               = var.starter_locations
  subscription_id_connectivity    = var.subscription_id_connectivity
  subscription_id_identity        = var.subscription_id_identity
  subscription_id_management      = var.subscription_id_management
  root_parent_management_group_id = var.root_parent_management_group_id

  custom_replacements = var.custom_replacements
  
  management_resource_settings        = var.management_resource_settings
  management_group_settings           = var.management_group_settings
  tags                                = var.tags
}
