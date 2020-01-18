resource "vsphere_virtual_machine" "vm" {
  name                 = "${var.vmname}${var.vmnamesuffix}"
  resource_pool_id     = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_cluster_id = "${data.vsphere_datastore_cluster.datastore_cluster.id}"
  folder               = "Backups/OPEN"

  num_cpus                   = "${var.cpu}"
  cpu_hot_add_enabled        = true
  memory                     = "${var.memory}"
  memory_hot_add_enabled     = true
  guest_id                   = "${var.guestos}"
  wait_for_guest_ip_timeout  = 0
  wait_for_guest_net_timeout = 0

  tags = [
    "${data.vsphere_tag.tag_environmenttype.id}",
    "${data.vsphere_tag.tag_owner.id}",
    "${data.vsphere_tag.tag_application.id}",
    "${data.vsphere_tag.tag_networklocation.id}",
    "${data.vsphere_tag.tag_backup.id}",
  ]

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "${var.disk_label}"
    size             = "${var.disksize}"
    thin_provisioned = false
  }

  cdrom {
    client_device = true
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      windows_options {
        computer_name         = "${var.hostname}"
        domain_admin_user     = "admin@contoso.com"
        domain_admin_password = "pass_123"
        join_domain           = "contoso.local"
        organization_name     = "contoso"
      }

      network_interface {
        ipv4_address    = "${var.ipaddress}"
        ipv4_netmask    = 24
        dns_server_list = "${var.dnsipaddress}"
        dns_domain      = "contoso.com"
      }

      ipv4_gateway    = "${var.defaultgateway}"
      dns_suffix_list = ["contoso.com"]
    }
  }
}
