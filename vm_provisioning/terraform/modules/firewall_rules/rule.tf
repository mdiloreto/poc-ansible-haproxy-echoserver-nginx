resource "google_compute_firewall" "rule" {
  for_each = { for idx, rule in var.rules : idx => rule }

  name    = each.value.name
  network = each.value.network

  dynamic "allow" {
    for_each = each.value.action == "allow" ? [1] : []
    content {
      protocol = each.value.protocol
      ports    = each.value.ports
    }
  }

  dynamic "deny" {
    for_each = each.value.action == "deny" ? [1] : []
    content {
      protocol = each.value.protocol
      ports    = each.value.ports
    }
  }

  source_ranges      = each.value.source_ranges
  destination_ranges = each.value.destination_ranges
  source_tags        = each.value.source_tags
}


