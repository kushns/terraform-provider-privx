# PrivX Host Resource Examples

This directory contains examples for using the `privx_host` resource.

## Files

- `basic.tf` - Basic host configuration with minimal required fields
- `resource.tf` - Comprehensive examples showing various host configurations

## Usage

1. **Basic SSH Host**: Creates a simple SSH host with one service and principal
2. **Host with Password Rotation**: Shows how to configure password rotation
3. **AWS EC2 Host**: Example of configuring a cloud-based host with SSH keys

## Required Fields

- `common_name` - Display name for the host
- `addresses` - List of IP addresses or hostnames
- `source_id` - ID of the source that manages this host
- `access_group_id` - ID of the access group for this host

## Optional Configuration

- `services` - Define connection services (SSH, RDP, etc.)
- `principals` - Configure user accounts and their roles
- `ssh_host_public_keys` - Add SSH host public keys for verification
- `session_recording_options` - Configure session recording settings
- `tags` - Add metadata tags for organization

## Notes

- At least one service should be configured for the host to be usable
- Principals define which users can access the host and with what permissions
- SSH host public keys are recommended for secure connections