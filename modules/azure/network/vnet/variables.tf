variable "location" {
  description = "Resource Group Location"
}

variable "resource_group_name" {
  description = "Resource Group Name"
}

variable "tags" {
  description = "Azure Tags"
}

variable "vnet_name" {
  description = "Virtual Network Name"
}

variable "vnet_address_space" {
  description = "Vnet Address Space"
}

variable "depends-on" {
  description = "Dependencies"
}
