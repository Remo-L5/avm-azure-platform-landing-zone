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

# The following variables are used to configure the connectivity resources in the ALZ.
# These have been added to the varaibles.tf but also the config_templating module to be able to use them in this file.
# express_route_circuit_vlan_id      = 200
# express_route_circuit_peer_asn     = 00000000
# express_route_circuit_customer_asn = 00000000
# express_route_circuit_shared_key   = "FAKE_SHARED_KEY"

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
    management_resource_group_name               = "rg-management-$${starter_location_01}"
    connectivity_hub_primary_resource_group_name = "rg-hub-$${starter_location_01}"
    dns_resource_group_name                      = "rg-hub-dns-$${starter_location_01}"
    express_route_resource_group_name            = "rg-hub-er-$${starter_location_01}"
    # ddos_resource_group_name                     = "rg-hub-ddos-$${starter_location_01}"

    # Resource names
    log_analytics_workspace_name = "law-management-$${starter_location_01}"

    # Resource names primary connectivity
    primary_virtual_network_name                                 = "vnet-hub-$${starter_location_01}"
    primary_firewall_name                                        = "fw-hub-$${starter_location_01}"
    custom_firewall_policy_name                                  = "primary-fw-policy-$${starter_location_01}"
    primary_firewall_policy_name                                 = "fwp-hub-$${starter_location_01}"
    primary_firewall_public_ip_name                              = "pip-fw-hub-$${starter_location_01}"
    primary_firewall_mgmt_public_ip_name                         = "pip-fw-mgmt-hub-$${starter_location_01}"
    primary_route_table_firewall_name                            = "rt-hub-fw-$${starter_location_01}"
    primary_route_table_user_subnets_name                        = "rt-hub-std-$${starter_location_01}"
    primary_virtual_network_gateway_express_route_name           = "vgw-hub-er-$${starter_location_01}"
    primary_virtual_network_gateway_express_route_public_ip_name = "pip-vgw-hub-er-$${starter_location_01}"
    primary_virtual_network_gateway_vpn_name                     = "vgw-hub-vpn-$${starter_location_01}"
    primary_virtual_network_gateway_vpn_public_ip_name_1         = "pip-vgw-hub-vpn-$${starter_location_01}-001"
    primary_virtual_network_gateway_vpn_public_ip_name_2         = "pip-vgw-hub-vpn-$${starter_location_01}-002"
    primary_private_dns_resolver_name                            = "pdr-hub-dns-$${starter_location_01}"
    primary_bastion_host_name                                    = "bas-hub-$${starter_location_01}"
    primary_bastion_host_public_ip_name                          = "pip-bastion-hub-$${starter_location_01}"
    primary_web_services_subnet_name                             = "WebServicesSubnet"
    primary_private_dns_resolver_inbound_subnet_name             = "InboundEndpointSubnet"
    primary_private_dns_resolver_outbound_subnet_name            = "OutboundEndpointSubnet"
    primary_private_endpoint_subnet_name                         = "PrivateEndpointSubnet"
    primary_express_route_circuit_name                           = "erc-hub-$${starter_location_01}"
    primary_express_route_connection_name                        = "cn-er-vng-$${starter_location_01}"
    primary_express_route_route_table_name                       = "rt-er-hub-$${starter_location_01}"


    # Private DNS Zones primary
    primary_auto_registration_zone_name = "$${starter_location_01}.azure.local"

    # TODO - UPDATE WITH YOUR IP RANGES
    # IP Ranges Primary
    # Regional Address Space: 10.0.0.0/16
    primary_hub_address_space                                   = "10.0.0.0/18"
    primary_hub_virtual_network_address_space                   = "10.0.2.0/23"
    primary_firewall_subnet_address_prefix                      = "10.0.2.0/26"
    primary_firewall_mgmt_subnet_address_prefix                 = "10.0.2.64/26"
    primary_gateway_subnet_address_prefix                       = "10.0.2.128/26"
    primary_bastion_subnet_address_prefix                       = "10.0.2.192/26"
    primary_web_services_subnet_address_prefix                  = "10.0.3.0/27"
    primary_private_dns_resolver_inbound_subnet_address_prefix  = "10.0.3.32/28"
    primary_private_dns_resolver_outbound_subnet_address_prefix = "10.0.3.48/28"
    primary_private_endpoint_subnet_address_prefix              = "10.0.3.64/28"
  }

  /* 
  --- Custom Resource Group Identifier Replacements ---
  You can define custom resource group identifiers to use throughout the configuration. 
  You can only use the templated variables and custom names in this section.
  NOTE: You cannot refer to another custom resource group identifier in this variable.
  */
  resource_group_identifiers = {
    management_resource_group_id    = "/subscriptions/$${subscription_id_management}/resourceGroups/$${management_resource_group_name}"
    express_route_resource_group_id = "/subscriptions/$${subscription_id_connectivity}/resourceGroups/$${express_route_resource_group_name}"
    virtual_network_resource_group_id = "/subscriptions/$${subscription_id_connectivity}/resourceGroups/$${connectivity_hub_primary_resource_group_name}"
  }

  /* 
  --- Custom Resource Identifier Replacements ---
  You can define custom resource identifiers to use throughout the configuration. 
  You can only use the templated variables, custom names and customer resource group identifiers in this variable.
  NOTE: You cannot refer to another custom resource identifier in this variable.
  */
  resource_identifiers = {
    primary_express_route_circuit_id = "$${express_route_resource_group_id}/providers/Microsoft.Network/expressRouteCircuits/$${primary_express_route_circuit_name}"
    log_analytics_workspace_id       = "$${management_resource_group_id}/providers/Microsoft.OperationalInsights/workspaces/$${log_analytics_workspace_name}"
    bastion_virtual_network_id = "$${virtual_network_resource_group_id}/providers/Microsoft.Network/virtualNetworks/$${primary_virtual_network_name}"
  }
}

enable_telemetry = false

/*
--- Tags ---
This variable can be used to apply tags to all resources that support it. Some resources allow overriding these tags.
*/
tags = {
  deployed_by = "terraform"
  source      = "Azure Landing Zones Accelerator"
}

/* 
--- Connectivity - Hub and Spoke Virtual Network ---
You can use this section to customize the hub virtual networking that will be deployed.
*/
connectivity_type = "hub_and_spoke_vnet"

# TODO - UPDATE WITH YOUR NAMING CONVENTIONS
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

hub_and_spoke_vnet_settings = {}

hub_and_spoke_vnet_virtual_networks = {
  primary = {
    hub_virtual_network = {
      name                  = "$${primary_virtual_network_name}"
      resource_group_name   = "$${connectivity_hub_primary_resource_group_name}"
      location              = "$${starter_location_01}"
      address_space         = ["$${primary_hub_virtual_network_address_space}"]
      routing_address_space = ["$${primary_hub_address_space}"]
      # route_table_name_firewall     = "$${primary_route_table_firewall_name}"
      # route_table_name_user_subnets = "$${primary_route_table_user_subnets_name}"
      # ddos_protection_plan_id       = "$${ddos_protection_plan_id}"

      # TODO - UPDATE WITH YOUR DNS SERVERS - SHOULD BE FIREWALL PRIVATE IP ADDRESS
      dns_servers = [
        "168.63.129.16"
      ]

      resource_group_creation_enabled = false

      
      # TODO - UPDATE WITH YOUR SUBNET REQUIREMENTS
      subnets = {
        web_services = {
          name             = "$${primary_web_services_subnet_name}"
          address_prefixes = ["$${primary_web_services_subnet_address_prefix}"]
          service_endpoints = [
            "Microsoft.KeyVault",
            "Microsoft.Web",
          ]
        }
        private_endpoint = {
          name             = "$${primary_private_endpoint_subnet_name}"
          address_prefixes = ["$${primary_private_endpoint_subnet_address_prefix}"]
          route_table = {
            assign_generated_route_table = false
          }
          service_endpoints = [
            "Microsoft.Storage",
            "Microsoft.KeyVault",
            "Microsoft.Web",
          ]
        }
        dns_outbound = {
          name             = "$${primary_private_dns_resolver_outbound_subnet_name}"
          address_prefixes = ["$${primary_private_dns_resolver_outbound_subnet_address_prefix}"]
          route_table = {
            assign_generated_route_table = false
          }
          delegations = [
            {
              name = "Microsoft.Network.dnsResolvers"
              service_delegation = {
                name = "Microsoft.Network/dnsResolvers"
              }
            }
          ]
        }
      }
      # TODO - UPDATE WITH YOUR CONFIGURATION
      firewall = {
        subnet_address_prefix            = "$${primary_firewall_subnet_address_prefix}"
        management_subnet_address_prefix = "$${primary_firewall_mgmt_subnet_address_prefix}"
        name                             = "$${primary_firewall_name}"
        sku_name                         = "AZFW_VNet"
        sku_tier                         = "Standard"
        zones                            = "$${starter_location_01_availability_zones}"
        default_ip_configuration = {
          public_ip_config = {
            name  = "$${primary_firewall_public_ip_name}"
            zones = "$${starter_location_01_availability_zones}"
          }
        }
        management_ip_configuration = {
          public_ip_config = {
            name  = "$${primary_firewall_mgmt_public_ip_name}"
            zones = "$${starter_location_01_availability_zones}"
          }
        }

        # TODO - UPDATE WITH YOUR FIREWALL POLICY PARENT ID
        firewall_policy = {
          name           = "$${primary_firewall_policy_name}"
          sku            = "Standard"
          base_policy_id = "/subscriptions/$${subscription_id_connectivity}/resourceGroups/$${connectivity_hub_primary_resource_group_name}/providers/Microsoft.Network/firewallPolicies/$${custom_firewall_policy_name}"

        }
      }
    }
    # TODO - UPDATE WITH YOUR HYBRID NETWORKING REQUIREMENTS
    # virtual_network_gateways = {
    #   subnet_address_prefix = "$${primary_gateway_subnet_address_prefix}"
    #   express_route = {
    #     enabled  = true
    #     location = "$${starter_location_01}"
    #     name     = "$${primary_virtual_network_gateway_express_route_name}"
    #     sku      = "$${starter_location_01_virtual_network_gateway_sku_express_route}"
    #     ip_configurations = {
    #       default = {
    #         public_ip = {
    #           name                    = "$${primary_virtual_network_gateway_express_route_public_ip_name}"
    #           zones                   = "$${starter_location_01_availability_zones}"
    #           creation_enabled        = true
    #           allocation_method       = "Static"   # Static or Dynamic
    #           sku                     = "Standard" # Standard or Basic
    #           sku_tier                = "Regional" # Regional or Global
    #           zones                   = [1, 2, 3]  # Availability zones for the public IP
    #           ddos_protection_mode    = "Enabled"
    #           ddos_protection_plan_id = null
    #         }
    #       }
    #     }
    #     route_table_bgp_route_propagation_enabled = true
    #     route_table_creation_enabled              = true
    #     route_table_name                          = "$${primary_express_route_route_table_name}"
    #     vpn_type                                  = "RouteBased" # PolicyBased or RouteBased, ExpressRoute only supports RouteBased
    #     express_route_circuits = {
    #       primary = {
    #         id = "$${primary_express_route_circuit_id}" # The ID of the ExpressRoute Circuit that must already exist
    #         connection = {
    #           name                           = "$${primary_express_route_connection_name}"
    #           resource_group_name            = "$${express_route_resource_group_name}"
    #           shared_key                     = "$${express_route_circuit_shared_key}" # Should be stored in Key Vault, ALZ owner to provide to the ER provider
    #           express_route_gateway_bypass   = false
    #           private_link_fast_path_enabled = false
    #           routing_weight                 = 10
    #         }
    #         peering = {
    #           peering_type                  = "AzurePrivatePeering"
    #           vlan_id                       = "$${express_route_circuit_vlan_id}" # Should be passed in as a variable
    #           resource_group_name           = "$${express_route_resource_group_name}"
    #           primary_peer_address_prefix   = "NOT_SET"
    #           secondary_peer_address_prefix = "NOT_SET"
    #           ipv4_enabled                  = true
    #           peer_asn                      = "$${express_route_circuit_peer_asn}"   # Should be passed in as a variable
    #           shared_key                    = "$${express_route_circuit_shared_key}" # Should be stored in Key Vault
    #           microsoft_peering_config = {
    #             advertised_public_prefixes = ["10.0.0.0/16"] # Example prefix, should be updated with actual prefixes
    #             microsoft_advertised_public_prefixes = ["8.0.0.0/16"] # Example prefix, should be updated with actual prefixes
    #             microsoft_advertised_communities = ["NOT_SET"] # Example community, should be updated with actual communities
    #             microsoft_customer_asn = "$${express_route_circuit_customer_asn}" # Should be passed in as a variable
    #             microsoft_routing_registry_name = "NOT_SET" # Example registry name, should be updated with actual registry
    #           }
    #         }
    #       }
    #     }
    #   }
    #   vpn = {
    #     enabled = false
    #     location = "$${starter_location_01}"
    #     name     = "$${primary_virtual_network_gateway_vpn_name}"
    #     sku      = "$${starter_location_01_virtual_network_gateway_sku_vpn}"
    #     enable_bgp = true
    #     vpn_bgp_enabled = true # Added to fix the bgp going away on apply x4
    #     ip_configurations = {
    #       active_active_1 = {
    #         public_ip = {
    #           name  = "$${primary_virtual_network_gateway_vpn_public_ip_name_1}"
    #           zones = "$${starter_location_01_availability_zones}"
    #         }
    #       }
    #       active_active_2 = {
    #         public_ip = {
    #           name  = "$${primary_virtual_network_gateway_vpn_public_ip_name_2}"
    #           zones = "$${starter_location_01_availability_zones}"
    #         }
    #       }
    #     }
    #     local_network_gateways = {
    #       primary = {
    #         name = "$${primary_express_route_local_gateway_connection_name}"
    #         resource_group_name = "$${connectivity_hub_primary_resource_group_name}"
    #         location = "$${starter_location_01}"
    #         address_space = ["NOT_SET"]
    #         gateway_fqdn = "NOT_SET"
    #         gateway_address = "NOT_SET"
    #         bgp_settings = {
    #           asn = 00000000000000000000
    #           bgp_peering_address = "NOT_SET"
    #           peer_weight = 0
    #         }
    #         connection = {
    #           name = "NOT_SET"
    #           resource_group_name = "$${connectivity_hub_primary_resource_group_name}"
    #           type = "" # IPsec or Vnet2Vnet
    #           connection_mode = ""
    #           connection_protocol = "IKEv2" # IKEv2 or IKEv1
    #           dpd_timeout_seconds = 30
    #           egress_nat_rule_ids = []
    #           ingress_nat_rule_ids = []
    #           enable_bgp = true
    #           local_azure_ip_address_enabled = false
    #           peer_virtual_network_gateway_id = "NOT_SET" # The ID of the peer virtual network gateway, should be handled by the AVM module
    #           shared_key = "NOT_SET" # Must be stored in Key Vault
    #           routing_weight = 10
    #           use_policy_based_traffic_selectors = false
    #           traffic_selector_policy = []
    #           custom_bgp_address = {
    #             primary = "NOT_SET"
    #             secondary = "NOT_SET"
    #           }
    #           ipsec_policy = {
    #             sa_lifetime = 3600
    #             sa_datasize = 102400000 # in kilobytes
    #             ipsec_encryption = "AES256"
    #             ipsec_integrity = "SHA256"
    #             ike_encryption = "AES256"
    #             ike_integrity = "SHA256"
    #             dh_group = "DHGroup14"
    #             pfs_group = "PFS14"
    #           }
    #         }
    #       }
    #     }
    #   }
    # }
    # private_dns_resolver = {
    #   enabled                        = true
    #   subnet_name                    = "$${primary_private_dns_resolver_inbound_subnet_name}"
    #   subnet_default_outbound_access = false
    #   subnet_address_prefix          = "$${primary_private_dns_resolver_inbound_subnet_address_prefix}"
    #   dns_resolver = {
    #     name                           = "$${primary_private_dns_resolver_name}"
    #     subnet_name                    = "$${primary_private_dns_resolver_inbound_subnet_name}"
    #     subnet_default_outbound_access = false
    #     subnet_address_prefix          = "$${primary_private_dns_resolver_inbound_subnet_address_prefix}"
    #     outbound_endpoints = {
    #       default = {
    #         name        = "dns-default-outbound-endpoint"
    #         subnet_name = "$${primary_private_dns_resolver_outbound_subnet_name}"
    #         forwarding_ruleset = {
    #           default = {
    #             name                                        = "test-fwd-ruleset1"
    #             link_with_outbound_endpoint_virtual_network = true
    #             additionalVirtualNetworkLinks               = {}
    #             rules = {
    #               default = {
    #                 name        = "default-rule"
    #                 enabled     = true
    #                 domain_name = "rll.contoso.com."
    #                 destination_ip_addresses = {
    #                   "172.1.0.4" = "53"
    #                 }
    #               }
    #             }
    #           }
    #         }
    #       }
    #     }
    #   }
    # }
    private_dns_zones = {
      enabled                                    = true
      auto_registration_zone_enabled             = true
      auto_registration_zone_name                = "$${primary_auto_registration_zone_name}"
      auto_registration_zone_resource_group_name = "$${dns_resource_group_name}"

      dns_zones = {
        resource_group_name = "$${dns_resource_group_name}"
        # private_link_private_dns_zones = {
        #   azure_service_bus = {
        #     zone_name = "privatelink.servicebus.windows.net"
        #   }
        #   azure_storage_blob = {
        #     zone_name = "privatelink.blob.core.windows.net"
        #   }
        #   azure_storage_queue = {
        #     zone_name = "privatelink.queue.core.windows.net"
        #   }
        #   azure_storage_table = {
        #     zone_name = "privatelink.table.core.windows.net"
        #   }
        #   azure_storage_file = {
        #     zone_name = "privatelink.file.core.windows.net"
        #   }
        #   azure_storage_web = {
        #     zone_name = "privatelink.web.core.windows.net"
        #   }
        #   azure_avd_global = {
        #     zone_name = "privatelink-global.wvd.microsoft.com"
        #   }
        #   azure_avd_feed_mgmt = {
        #     zone_name = "privatelink.wvd.microsoft.com"
        #   }
        #   azure_sql_server = {
        #     zone_name = "privatelink.database.windows.net"
        #   }
        #   azure_api_management = {
        #     zone_name = "privatelink.azure-api.net"
        #   }
        #   azure_automation = {
        #     zone_name = "privatelink.azure-automation.net"
        #   }
        #   azure_monitor = {
        #     zone_name = "privatelink.monitor.azure.com"
        #   }
        #   azure_log_analytics = {
        #     zone_name = "privatelink.oms.opinsights.azure.com"
        #   }
        #   azure_log_analytics_data = {
        #     zone_name = "privatelink.ods.opinsights.azure.com"
        #   }
        #   azure_monitor_agent = {
        #     zone_name = "privatelink.agentsvc.azure-automation.net"
        #   }
        #   azure_key_vault = {
        #     zone_name = "privatelink.vaultcore.azure.net"
        #   }
        #   azure_app_configuration = {
        #     zone_name = "privatelink.azconfig.io"
        #   }
        #   azure_app_service = {
        #     zone_name = "privatelink.azurewebsites.net"
        #   }
        #   azure_app_service_scm = {
        #     zone_name = "scm.privatelink.azurewebsites.net"
        #   }
        # }
      }
    }
    bastion = {
      subnet_address_prefix = "$${primary_bastion_subnet_address_prefix}"
      bastion_host = {
        name               = "$${primary_bastion_host_name}"
        copy_paste_enabled = true
        zones = "$${starter_location_01_availability_zones}"
        sku = "Basic"
        #virtual_network_id = "$${bastion_virtual_network_id}" #Only supported for Developer SKU
      }
      bastion_public_ip = {
        name  = "$${primary_bastion_host_public_ip_name}"
        zones = "$${starter_location_01_availability_zones}"
      }
    }
  }
}