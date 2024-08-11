variable "rules" {
  description = "A list of firewall rule definitions"
  type = list(object({
    name               = string
    action             = string // "allow" or "deny"
    network            = string
    protocol           = string
    ports              = list(string)
    source_ranges      = list(string)
    destination_ranges = list(string)
    source_tags        = list(string)
  }))
}
