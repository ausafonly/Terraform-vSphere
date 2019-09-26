provider "vsphere" {
  user           = "${var.username}"
  password       = "${var.password}"
  vsphere_server = "${var.vcenter}"

  version = "1.11.0"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
}

data "vsphere_datastore_cluster" "datastore_cluster" {
  name          = "${var.datastorecluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "${var.computecluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vlan}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_tag_category" "tag_category_environmenttype" {
  name = "${var.tag_category_environmenttype}"
}

data "vsphere_tag_category" "tag_category_owner" {
  name = "${var.tag_category_owner}"
}

data "vsphere_tag_category" "tag_category_application" {
  name = "${var.tag_category_application}"
}

data "vsphere_tag_category" "tag_category_networklocation" {
  name = "${var.tag_category_networklocation}"
}

data "vsphere_tag_category" "tag_category_backup" {
  name = "${var.tag_category_backup}"
}

data "vsphere_tag" "tag_environmenttype" {
  name        = "${var.tag_environmenttype}"
  category_id = "${data.vsphere_tag_category.tag_category_environmenttype.id}"
}

data "vsphere_tag" "tag_owner" {
  name        = "${var.tag_owner}"
  category_id = "${data.vsphere_tag_category.tag_category_owner.id}"
}

data "vsphere_tag" "tag_application" {
  name        = "${var.tag_application}"
  category_id = "${data.vsphere_tag_category.tag_category_application.id}"
}

data "vsphere_tag" "tag_networklocation" {
  name        = "${var.tag_networklocation}"
  category_id = "${data.vsphere_tag_category.tag_category_networklocation.id}"
}

data "vsphere_tag" "tag_backup" {
  name        = "${var.tag_backup}"
  category_id = "${data.vsphere_tag_category.tag_category_backup.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vmtemplate}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
