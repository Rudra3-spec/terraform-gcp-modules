
resource "google_compute_instance" "my_vm" {
  project      = var.project_id
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

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

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance" "my_vm_2" {
  project      = var.project_id
  name         = var.vm_name_2
  machine_type = var.machine_type
  zone         = var.zone

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
}

