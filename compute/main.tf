resource "google_compute_instance" "vm" {
  for_each = {
    for vm in var.vms : vm.name => vm
  }

  project      = var.project_id
  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone

  tags = ["allow-iap-ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = var.subnetwork
    access_config {}
  }

  dynamic "service_account" {
    for_each = each.value.service_account_email == null ? [] : [1]
    content {
      email  = each.value.service_account_email
      scopes = ["cloud-platform"]
    }
  }
}
