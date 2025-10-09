# Basic host example for testing
resource "privx_host" "test" {
  common_name     = "test-host"
  addresses       = ["192.168.1.100"]
  source_id       = "test-source-id"
  access_group_id = "test-access-group-id"

  services = [{
    service = "SSH"
    address = "192.168.1.100"
    port    = 22
    source  = "UI"
  }]

  principals = [{
    principal = "testuser"
    source    = "UI"
    
    roles = [{
      id   = "test-role-id"
      name = "Test Role"
    }]
  }]
  tags = ["test", "terraform"]
}

# Minimal host for debugging
resource "privx_host" "minimal" {
  common_name     = "minimal-host"
  addresses       = ["10.0.0.1"]
  source_id       = "test-source-id"
  access_group_id = "test-access-group-id"
}