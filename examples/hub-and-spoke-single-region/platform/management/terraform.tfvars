/*
--- Built-in Replacements ---
This file contains built-in replacements to avoid repeating the same hard-coded values.
Replacements are denoted by the dollar-dollar curly braces token (e.g. $${starter_location_01}). The following details each built-in replacemnets that you can use:
`starter_location_01`: This the primary an Azure location sourced from the `starter_locations` variable. This can be used to set the location of resources.
`starter_location_02` to `starter_location_10`: These are the secondary Azure locations sourced from the `starter_locations` variable. This can be used to set the location of resources.
`starter_location_01_availability_zones` to `starter_location_10_availability_zones`: These are the availability zones for the Azure locations sourced from the `starter_locations` variable. This can be used to set the availability zones of resources.
`starter_location_01_virtual_network_gateway_sku_express_route` to `starter_location_10_virtual_network_gateway_sku_express_route`: These are the default SKUs for the Express Route virtual network gateways based on the Azure locations sourced from the `starter_locations` variable. This can be used to set the SKU of the virtual network gateways.
`starter_location_01_virtual_network_gateway_sku_vpn` to `starter_location_10_virtual_network_gateway_sku_vpn`: These are the default SKUs for the VPN virtual network gateways based on the Azure locations sourced from the `starter_locations` variable. This can be used to set the SKU of the virtual network gateways.
`root_parent_management_group_id`: This is the id of the management group that the ALZ hierarchy will be nested under.
`subscription_id_identity`: The subscription ID of the subscription to deploy the identity resources to, sourced from the variable `subscription_id_identity`.
`subscription_id_connectivity`: The subscription ID of the subscription to deploy the connectivity resources to, sourced from the variable `subscription_id_connectivity`.
`subscription_id_management`: The subscription ID of the subscription to deploy the management resources to, sourced from the variable `subscription_id_management`.
*/

root_parent_management_group_id = ""
starter_locations = [
  "westus"
]
subscription_id_connectivity = "NOT_SET"
subscription_id_identity     = "NOT_SET"
subscription_id_management   = "NOT_SET"

connectivity_resource_groups = {
  vnet_primary = {
    name     = "$${connectivity_hub_primary_resource_group_name}"
    location = "$${starter_location_01}"
  }
  dns = {
    name     = "$${dns_resource_group_name}"
    location = "$${starter_location_01}"
  }
  express_route = {
    name     = "$${express_route_resource_group_name}"
    location = "$${starter_location_01}"
  }
}

/*
--- Custom Replacements ---
You can define custom replacements to use throughout the configuration.
*/
custom_replacements = {
    /* 
    --- Custom Name Replacements ---
    You can define custom names and other strings to use throughout the configuration. 
    You can only use the built in replacements in this section.
    NOTE: You cannot refer to another custom name in this variable.
    */
    names = {
      # Defender email security contact
      defender_email_security_contact = "NOT_SET"

      # TODO - UPDATE WITH YOUR NAMING CONVENTIONS
  
      # Resource group names
      management_resource_group_name = "rg-management-$${starter_location_01}"
      asc_export_resource_group_name = "rg-asc-export-$${starter_location_01}"
      connectivity_hub_primary_resource_group_name = "rg-hub-$${starter_location_01}"
      dns_resource_group_name                      = "rg-hub-dns-$${starter_location_01}"
      express_route_resource_group_name            = "rg-hub-er-$${starter_location_01}"
  
      # Resource names
      log_analytics_workspace_name            = "law-management-$${starter_location_01}"
      automation_account_name                 = "aa-management-$${starter_location_01}"
      ama_user_assigned_managed_identity_name = "uami-management-ama-$${starter_location_01}"
      dcr_change_tracking_name                = "dcr-change-tracking"
      dcr_defender_sql_name                   = "dcr-defender-sql"
      dcr_vm_insights_name                    = "dcr-vm-insights"
    }
  
    /* 
    --- Custom Resource Group Identifier Replacements ---
    You can define custom resource group identifiers to use throughout the configuration. 
    You can only use the templated variables and custom names in this section.
    NOTE: You cannot refer to another custom resource group identifier in this variable.
    */
    resource_group_identifiers = {
      management_resource_group_id = "/subscriptions/$${subscription_id_management}/resourcegroups/$${management_resource_group_name}"
    }
  
    /* 
    --- Custom Resource Identifier Replacements ---
    You can define custom resource identifiers to use throughout the configuration. 
    You can only use the templated variables, custom names and customer resource group identifiers in this variable.
    NOTE: You cannot refer to another custom resource identifier in this variable.
    */
    resource_identifiers = {
      ama_change_tracking_data_collection_rule_id = "$${management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/$${dcr_change_tracking_name}"
      ama_mdfc_sql_data_collection_rule_id        = "$${management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/$${dcr_defender_sql_name}"
      ama_vm_insights_data_collection_rule_id     = "$${management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/$${dcr_vm_insights_name}"
      ama_user_assigned_managed_identity_id       = "$${management_resource_group_id}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/$${ama_user_assigned_managed_identity_name}"
      log_analytics_workspace_id                  = "$${management_resource_group_id}/providers/Microsoft.OperationalInsights/workspaces/$${log_analytics_workspace_name}"
    }
  }
  
  enable_telemetry = true
  
  /*
  --- Tags ---
  This variable can be used to apply tags to all resources that support it. Some resources allow overriding these tags.
  */
  tags = {
    deployed_by = "terraform"
    source      = "Azure Landing Zones Accelerator"
  }
  
  /* 
  --- Management Resources ---
  You can use this section to customize the management resources that will be deployed.
  */
  management_resource_settings = {
    location                     = "$${starter_location_01}"
    log_analytics_workspace_name = "$${log_analytics_workspace_name}"
    resource_group_name          = "$${management_resource_group_name}"
    resource_group_creation_enabled = true
    user_assigned_managed_identities = {
      ama = {
        name = "$${ama_user_assigned_managed_identity_name}"
      }
    }
    automation_account_name      = "$${automation_account_name}"
    automation_account_sku_name  = "Basic"
    automation_account_public_network_access_enabled = false
    automation_account_local_authentication_enabled = false


    data_collection_rules = {
      change_tracking = {
        name = "$${dcr_change_tracking_name}"
      }
      defender_sql = {
        name = "$${dcr_defender_sql_name}"
      }
      vm_insights = {
        name = "$${dcr_vm_insights_name}"
      }
    }
  }
  
  /* 
  --- Management Groups and Policy ---
  You can use this section to customize the management groups and policies that will be deployed.
  You can further configure management groups and policy by supplying a `lib` folder. This is detailed in the Accelerator documentation.
  */
  management_group_settings = {
    location           = "$${starter_location_01}"
    parent_resource_id = "$${root_parent_management_group_id}"
    architecture_name  = "alz_custom"
    policy_default_values = {
      # ama_change_tracking_data_collection_rule_id = "$${ama_change_tracking_data_collection_rule_id}"
      # ama_mdfc_sql_data_collection_rule_id        = "$${ama_mdfc_sql_data_collection_rule_id}"
      # ama_vm_insights_data_collection_rule_id     = "$${ama_vm_insights_data_collection_rule_id}"
      ama_user_assigned_managed_identity_id       = "$${ama_user_assigned_managed_identity_id}"
      ama_user_assigned_managed_identity_name     = "$${ama_user_assigned_managed_identity_name}"
      log_analytics_workspace_id                  = "$${log_analytics_workspace_id}"
    }
    
    management_group_hierarchy_settings = {
      default_management_group_name = "NOT_SET"
      require_authorization_for_group_creation = true
      update_existing = false
    }

    subscription_placement = {
      identity = {
        subscription_id       = "$${subscription_id_identity}"
        management_group_name = "alz-platform-identity"
      }
      connectivity = {
        subscription_id       = "$${subscription_id_connectivity}"
        management_group_name = "alz-platform-connectivity"
      }
      management = {
        subscription_id       = "$${subscription_id_management}"
        management_group_name = "alz-platform-management"
      }
    #   epac_dev = {
    #     subscription_id       = "NOT_SET"
    #     management_group_name = "alz-landingzones-epac-dev"
    #   }
    }
    policy_assignments_to_modify = {
      # alz = {
      #   policy_assignments = {
      #     Deploy-MDFC-Config-H224 = {
      #       parameters = {
      #         ascExportResourceGroupName                  = "$${asc_export_resource_group_name}"
      #         ascExportResourceGroupLocation              = "$${starter_location_01}"
      #         emailSecurityContact                        = "$${defender_email_security_contact}"
      #         enableAscForServers                         = "DeployIfNotExists"
      #         enableAscForServersVulnerabilityAssessments = "DeployIfNotExists"
      #         enableAscForSql                             = "DeployIfNotExists"
      #         enableAscForAppServices                     = "DeployIfNotExists"
      #         enableAscForStorage                         = "DeployIfNotExists"
      #         enableAscForContainers                      = "DeployIfNotExists"
      #         enableAscForKeyVault                        = "DeployIfNotExists"
      #         enableAscForSqlOnVm                         = "DeployIfNotExists"
      #         enableAscForArm                             = "DeployIfNotExists"
      #         enableAscForOssDb                           = "DeployIfNotExists"
      #         enableAscForCosmosDbs                       = "DeployIfNotExists"
      #         enableAscForCspm                            = "DeployIfNotExists"
      #       }
      #     }
      #   }
      # }
      connectivity = {
        policy_assignments = {
          Enable-DDoS-VNET = {
            enforcement_mode = "DoNotEnforce"
          }
        }
      }
    }
  }
  