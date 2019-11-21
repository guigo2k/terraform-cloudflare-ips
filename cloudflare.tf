data "external" "cloudflare" {
  program = ["sh", "${path.module}/cloudflare.sh"]
}

locals {
  ips_v4 = split(",", data.external.cloudflare.result.ips_v4)
  ips_v6 = split(",", data.external.cloudflare.result.ips_v6)
}

output "ips_v4" {
  value = local.ips_v4
}

output "ips_v6" {
  value = local.ips_v6
}
