# Get host by ID
data "privx_host" "by_id" {
  id = "295dbfa2-c291-4021-6caa-70ff2750bb8d"
}

# Get host by common name
data "privx_host" "by_name" {
  common_name = "web-server-01"
}

# Get host by common name - example with the failing case
data "privx_host" "falcon" {
  common_name = "Falcon Trustwave"
}

# Output host information
output "host_addresses" {
  description = "List of addresses for the host"
  value       = data.privx_host.by_name.addresses
}

output "host_services" {
  description = "Services configured on the host"
  value       = data.privx_host.by_name.services
}

output "host_principals" {
  description = "Principals configured on the host"
  value       = data.privx_host.by_name.principals
}

# Output falcon host information for debugging
output "falcon_host_id" {
  description = "ID of the Falcon host"
  value       = data.privx_host.falcon.id
}

output "falcon_host_addresses" {
  description = "Addresses of the Falcon host"
  value       = data.privx_host.falcon.addresses
}

# Use host data in other resources
resource "privx_role" "host_specific_role" {
  name        = "Admin for ${data.privx_host.by_name.common_name}"
  description = "Administrative role for host ${data.privx_host.by_name.common_name}"
  
  # You could use the host information to configure role permissions
  # based on the host's properties like tags, cloud provider, etc.
}