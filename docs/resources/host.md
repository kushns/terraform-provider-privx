# privx_host (Resource)

Manages a PrivX host resource. Hosts represent target systems that users can connect to through PrivX.

## Example Usage

```terraform
# Create a basic SSH host
resource "privx_host" "example" {
  common_name     = "example-server"
  addresses       = ["192.168.1.100", "server.example.com"]
  source_id       = "a0ad72dc-b4aa-4a53-b7e0-14902b8b18bd"
  access_group_id = "bfe74d8b-feda-46f1-7ac3-b37ef5b15e3b"

  services {
    service = "SSH"
    address = "192.168.1.100"
    port    = 22
    source  = "UI"
  }

  principals {
    principal = "ubuntu"
    source    = "UI"
    
    roles {
      id   = "e2dcbeb4-6b07-50ad-788a-5af830da74ca"
      name = "Linux-admin"
    }
  }

  tags = ["production", "web-server"]
}

# Create a host with password rotation enabled
resource "privx_host" "with_rotation" {
  common_name                = "db-server"
  addresses                  = ["10.0.1.50"]
  source_id                  = "a0ad72dc-b4aa-4a53-b7e0-14902b8b18bd"
  access_group_id            = "bfe74d8b-feda-46f1-7ac3-b37ef5b15e3b"
  password_rotation_enabled  = true

  services {
    service                    = "SSH"
    address                    = "10.0.1.50"
    port                       = 22
    use_for_password_rotation  = true
    source                     = "UI"
  }

  principals {
    principal                  = "dbadmin"
    use_for_password_rotation  = true
    source                     = "UI"
    
    roles {
      id   = "db-admin-role-id"
      name = "Database Admin"
    }
  }

  session_recording_options {
    disable_clipboard_recording     = false
    disable_file_transfer_recording = false
  }
}
```

## Schema

### Required

- `addresses` (List of String) List of host addresses (IP addresses or hostnames)
- `access_group_id` (String) Access Group ID for the host
- `common_name` (String) Host common name (display name)
- `source_id` (String) Source ID for the host

### Optional

- `audit_enabled` (Boolean) Whether audit is enabled for the host. Defaults to `false`.
- `cloud_provider` (String) Cloud provider for the host. Defaults to `""`.
- `cloud_provider_region` (String) Cloud provider region for the host. Defaults to `""`.
- `comment` (String) Comment for the host. Defaults to `""`.
- `contact_address` (String) Contact address for the host. Defaults to `""`.
- `deployable` (Boolean) Whether the host is deployable. Defaults to `false`.
- `disabled` (String) Whether the host is disabled. Defaults to `"FALSE"`.
- `distinguished_name` (String) Distinguished name for the host. Defaults to `""`.
- `external_id` (String) External ID for the host. Defaults to `""`.
- `host_classification` (String) Host classification. Defaults to `""`.
- `host_type` (String) Host type. Defaults to `""`.
- `instance_id` (String) Instance ID for the host. Defaults to `""`.
- `organization` (String) Organization for the host. Defaults to `""`.
- `organizational_unit` (String) Organizational unit for the host. Defaults to `""`.
- `password_rotation_enabled` (Boolean) Whether password rotation is enabled. Defaults to `false`.
- `principals` (Block List) List of principals for the host (see [below for nested schema](#nestedblock--principals))
- `services` (Block List) List of services for the host (see [below for nested schema](#nestedblock--services))
- `session_recording_options` (Block) Session recording options (see [below for nested schema](#nestedblock--session_recording_options))
- `ssh_host_public_keys` (Block List) List of SSH host public keys (see [below for nested schema](#nestedblock--ssh_host_public_keys))
- `tags` (List of String) List of tags for the host (order preserved when possible, sorted when tags change)
- `toch` (Boolean) TOCH setting. Defaults to `false`.
- `tofu` (Boolean) TOFU (Trust On First Use) setting. Defaults to `false`.
- `user_message` (String) User message for the host. Defaults to `""`.
- `zone` (String) Zone for the host. Defaults to `""`.

### Read-Only

- `created` (String) Creation timestamp
- `id` (String) Host ID
- `updated` (String) Last update timestamp
- `updated_by` (String) ID of user who last updated the host

<a id="nestedblock--principals"></a>
### Nested Schema for `principals`

#### Required

- `principal` (String) Principal name (username)

#### Optional

- `applications` (List of String) List of applications for the principal
- `passphrase` (String) Principal passphrase (write-only, API returns masked value). Defaults to `""`.
- `roles` (Block List) List of roles for the principal (see [below for nested schema](#nestedblock--principals--roles))
- `rotate` (Boolean) Whether to rotate the principal. Defaults to `false`.
- `source` (String) Principal source. Defaults to `"UI"`.
- `use_for_password_rotation` (Boolean) Use this principal for password rotation. Defaults to `false`.
- `use_user_account` (Boolean) Use user account. Defaults to `false`.
- `username_attribute` (String) Username attribute. Defaults to `""`.

<a id="nestedblock--principals--roles"></a>
### Nested Schema for `principals.roles`

#### Required

- `id` (String) Role ID

#### Optional

- `name` (String) Role name

<a id="nestedblock--services"></a>
### Nested Schema for `services`

#### Required

- `service` (String) Service type (e.g., SSH, RDP, HTTP)

#### Optional

- `address` (String) Service address
- `port` (Number) Service port. Defaults to `22`.
- `source` (String) Service source. Defaults to `"UI"`.
- `ssh_tunnel_port` (Number) SSH tunnel port. Defaults to `0`.
- `use_for_password_rotation` (Boolean) Use this service for password rotation. Defaults to `false`.
- `use_plaintext_vnc` (Boolean) Use plaintext VNC. Defaults to `false`.

<a id="nestedblock--session_recording_options"></a>
### Nested Schema for `session_recording_options`

#### Optional

- `disable_clipboard_recording` (Boolean) Disable clipboard recording. Defaults to `false`.
- `disable_file_transfer_recording` (Boolean) Disable file transfer recording. Defaults to `false`.

<a id="nestedblock--ssh_host_public_keys"></a>
### Nested Schema for `ssh_host_public_keys`

#### Required

- `key` (String) SSH public key

#### Optional

- `fingerprint` (String) SSH key fingerprint

## Import

Hosts can be imported using their ID:

```shell
terraform import privx_host.example 295dbfa2-c291-4021-6caa-70ff2750bb8d
```