datacenter = "dc1"
data_dir   = "/opt/nomad/data"
bind_addr  = "0.0.0.0"
region     = "home"

advertise {
  http = "{{ GetPrivateIP }}"
  rpc  = "{{ GetPrivateIP }}"
  serf = "{{ GetPrivateIP }}"
}

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled = true

  options {
    docker.privileged.enabled = "true"
    driver.raw_exec.enable    = "1"
    docker.volumes.enabled    = "true"
  }

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
    cidr = "192.168.0.0/16"
  }
}

plugin "docker" {
  config {
    allow_caps = ["CHOWN", "DAC_OVERRIDE", "FSETID", "FOWNER", "MKNOD", "NET_RAW", "SETGID", "SETUID", "SETFCAP", "SETPCAP", "NET_BIND_SERVICE", "SYS_CHROOT", "KILL", "AUDIT_WRITE", "NET_ADMIN", "NET_BROADCAST", "SYS_MODULE"]
    allow_privileged = true
    volumes {
      enabled = true
    }
  }
}

consul {
  address = "127.0.0.1:8500"
}
