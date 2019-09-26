variable "username" {
  type        = "string"
  description = "Type username to connect vCenter"
}

variable "password" {
  type        = "string"
  description = "Type password to connect vCenter"
}

variable "vcenter" {
  type        = "string"
  description = "Type name of the vCenter"
}

variable "datacenter" {
  type        = "string"
  description = "Type name of the datacenter"
}

variable "disk_label" {
  type    = "string"
  default = "disk0"
}

variable "tag_category_environmenttype" {
  type    = "string"
  default = "EnvironmentType"
}

variable "tag_category_owner" {
  type    = "string"
  default = "Owner"
}

variable "tag_category_application" {
  type    = "string"
  default = "Application"
}

variable "tag_category_networklocation" {
  type    = "string"
  default = "Network Location"
}

variable "tag_category_backup" {
  type    = "string"
  default = "Backup"
}

variable "tag_environmenttype" {
  description = "Type tag name for environment type"
}

variable "tag_owner" {
  description = "Type tag name for owner"
}

variable "tag_application" {
  description = "Type tag name of the application"
}

variable "tag_networklocation" {
  description = "Type tag name of the network location"
}

variable "tag_backup" {
  description = "Type tag "
}

variable "memory" {
  type    = "string"
  default = "4096"
}

variable "cpu" {
  type    = "string"
  default = "2"
}

variable "guestos" {
  type    = "string"
  default = "windows9Server64Guest"
}

variable "computecluster" {
  type        = "string"
  description = "Name of the computer cluster...."
}

variable "datastorecluster" {
  type        = "string"
  description = "Name of the storage cluster...."
}

variable "disksize" {
  type    = "string"
  default = "60"
}

variable "vlan" {
  type        = "string"
  description = "Name of the VLAN....."
}

variable "vmname" {
  description = "Name of the virtual machine"
}

variable "vmnamesuffix" {
  description = "vmname suffix after numbered index coming from instance variable"
}

variable "hostname" {
  description = "Host name of the virtual machine"
}

variable "ipaddress" {
  description = "IPv4 address of virtual machine"
}

variable "dnsipaddress" {
  type        = "list"
  description = "IPV4 addresses of dns servers seperated by comma. Example 8.8.8.8, 8.8.4.4"
  default     = ["8.8.8.8"]
}

variable "defaultgateway" {
  type        = "string"
  description = "IPV4 addresses of default gateway"
}

variable "vmtemplate" {
  type        = "string"
  description = "Name of the template to clone machine"
}
