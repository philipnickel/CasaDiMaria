datacenter = "dc1"
data_dir   = "/opt/consul/data"
bind_addr  = "0.0.0.0"
client_addr = "0.0.0.0"

server           = true
bootstrap_expect = 1

ui_config {
  enabled = true
}

log_level = "WARN"
