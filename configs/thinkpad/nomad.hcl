datacenter = "dc1"
data_dir   = "/opt/nomad/data"
bind_addr  = "0.0.0.0"
region     = "home"

advertise {
  http = "{{ GetInterfaceIP \"wlp0s20f3\" }}"
  rpc  = "{{ GetInterfaceIP \"wlp0s20f3\" }}"
  serf = "{{ GetInterfaceIP \"wlp0s20f3\" }}"
}

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled = true

  host_volume "media" {
    path      = "/media/t7/media"
    read_only = false
  }

  host_volume "config" {
    path      = "/opt/nomad/config-volumes"
    read_only = false
  }

  host_volume "downloads" {
    path      = "/media/t7/downloads"
    read_only = false
  }

  meta {
    shared_mount = "true"
  }

  host_network "tailscale" {
    cidr = "100.0.0.0/8"
  }

  host_network "lan" {
    cidr = "192.168.1.0/24"
  }
}

plugin "docker" {
  config {
    allow_privileged = true
    volumes {
      enabled = true
    }
  }
}

consul {
  address = "127.0.0.1:8500"
}
