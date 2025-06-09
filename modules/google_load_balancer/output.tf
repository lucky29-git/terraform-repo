output "forwarding_rule_ips" {
  value = { for k, v in google_compute_global_forwarding_rule.forwarding_rule : k => v.ip_address }
}
