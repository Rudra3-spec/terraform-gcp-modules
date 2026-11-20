resource "google_compute_network" "my_vpc" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnet" {
  project       = var.project_id
  name          = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = google_compute_network.my_vpc.id
}

resource "google_compute_firewall" "rules" {
  for_each = {
    for rule in var.firewall_rules : rule.name => rule
  }

  project       = var.project_id
  name          = each.value.name
  network       = google_compute_network.my_vpc.name
  direction     = each.value.direction
  source_ranges = each.value.source_ranges
  target_tags   = each.value.target_tags

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }
}
