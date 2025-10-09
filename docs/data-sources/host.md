# privx_host (Data Source)

Retrieves information about a PrivX host. You can look up a host by either its ID or common name.

## Example Usage

```terraform
# Get host by ID
data "privx_host" "by_id" {
  id = "295dbfa2-c291-4021-6caa-70ff2750bb8d"
}

# Get host by common name
data "privx_host" "by_name" {
  common_name = "example-server"
}

# Use the host data in other resources
resource "privx_role" "host_admin" {
  name = "Admin for ${data.privx_host.by_name.common_name}"
  
  # Reference host information
  # host_id = data.privx_host.by_name.id
}
```

## Schema

### Optional

- `common_name` (String) Host common name. Either id or common_name must be specified.
- `id` (String) Host UUID. Either id or common_name must be specified.

### Read-Only

- `access_group_id` (String) Access Group ID for the host
- `addresses` (List of String) List of host addresses
- `audit_enabled` (Boolean) Whether audit is enabled for the host
- `cloud_provider` (String) Cloud provider for the host
- `cloud_provider_region` (String) Cloud provider region for the host
- `comment` (String) Comment for the host
- `contact_address` (String) Contact address for the host
- `created` (String) Creation timestamp
- `deployable` (Boolean) Whether the host is deployable
- `disabled` (String) Whether the host is disabled
- `distinguished_name` (String) Distinguished name for the host
- `external_id` (String) External ID for the host
- `host_classification` (String) Host classification
- `host_type` (String) Host type
- `instance_id` (String) Instance ID for the host
- `organization` (String) Organization for the host
- `organizational_unit` (String) Organizational unit for the host
- `password_rotation_enabled` (Boolean) Whether password rotation is enabled
- `principals` (Block List) List of principals for the host (see [below for nested schema](#nestedblock--principals))
- `services` (Block List) List of services for the host (see [below for nested schema](#nestedblock--services))
- `session_recording_options` (Block) Session recording options (see [below for nested schema](#nestedblock--session_recording_options))
- `source_id` (String) Source ID for the host
- `ssh_host_public_keys` (Block List) List of SSH host public keys (see [below for nested schema](#nestedblock--ssh_host_public_keys))
- `tags` (List of String) List of tags for the host (sorted alphabetically)
- `toch` (Boolean) TOCH setting
- `tofu` (Boolean) TOFU (Trust On First Use) setting
- `updated` (String) Last update timestamp
- `updated_by` (String) ID of user who last updated the host
- `user_message` (String) User message for the host
- `zone` (String) Zone for the host

<a id="nestedblock--principals"></a>
### Nested Schema for `principals`

#### Read-Only

- `applications` (List of String) List of applications for the principal
- `passphrase` (String) Principal passphrase (masked by API)
- `principal` (String) Principal name
- `roles` (Block List) List of roles for the principal (see [below for nested schema](#nestedblock--principals--roles))
- `rotate` (Boolean) Whether to rotate the principal
- `source` (String) Principal source
- `use_for_password_rotation` (Boolean) Use this principal for password rotation
- `use_user_account` (Boolean) Use user account
- `username_attribute` (String) Username attribute

<a id="nestedblock--principals--roles"></a>
### Nested Schema for `principals.roles`

#### Read-Only

- `id` (String) Role ID
- `name` (String) Role name

<a id="nestedblock--services"></a>
### Nested Schema for `services`

#### Read-Only

- `address` (String) Service address
- `port` (Number) Service port
- `service` (String) Service type (e.g., SSH, RDP, HTTP)
- `source` (String) Service source
- `ssh_tunnel_port` (Number) SSH tunnel port
- `status` (String) Service status
- `status_updated` (String) Service status last updated
- `use_for_password_rotation` (Boolean) Use this service for password rotation
- `use_plaintext_vnc` (Boolean) Use plaintext VNC

<a id="nestedblock--session_recording_options"></a>
### Nested Schema for `session_recording_options`

#### Read-Only

- `disable_clipboard_recording` (Boolean) Disable clipboard recording
- `disable_file_transfer_recording` (Boolean) Disable file transfer recording

<a id="nestedblock--ssh_host_public_keys"></a>
### Nested Schema for `ssh_host_public_keys`

#### Read-Only

- `fingerprint` (String) SSH key fingerprint
- `key` (String) SSH public key