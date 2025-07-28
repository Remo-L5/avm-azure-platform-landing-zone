variable "management_resource_settings" {
  type        = any
  default     = {}
  description = <<DESCRIPTION
The settings for the management resources. Details of the settings can be found in the module documentation at https://registry.terraform.io/modules/Azure/avm-ptn-alz-management
DESCRIPTION
}

variable "management_group_settings" {
  type        = any
  default     = {}
  description = <<DESCRIPTION
The settings for the management groups. Details of the settings can be found in the module documentation at https://registry.terraform.io/modules/Azure/avm-ptn-alz
DESCRIPTION
}

variable "connectivity_resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string))
    settings = optional(any)
  }))
  default     = {}
  description = <<DESCRIPTION
A map of resource groups to create. These must be created before the connectivity module is applied.

The following attributes are supported:

  - name: The name of the resource group
  - location: The location of the resource group
  - settings: (Optional) An object, which can include an `enabled` setting value that indicates whether the resource group should be created.

DESCRIPTION
}
