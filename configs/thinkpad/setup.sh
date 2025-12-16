#!/bin/bash
set -e

echo "=== Setting up Nomad + Consul on thinkpad ==="

# Create directories
sudo mkdir -p /opt/nomad/data
sudo mkdir -p /opt/nomad/config-volumes
sudo mkdir -p /opt/consul/data
sudo mkdir -p /media/t7/downloads

# Copy configs
sudo cp nomad.hcl /etc/nomad.d/nomad.hcl
sudo cp consul.hcl /etc/consul.d/consul.hcl

# Enable and start services
sudo systemctl enable consul
sudo systemctl enable nomad
sudo systemctl start consul
sleep 3
sudo systemctl start nomad

echo "=== Services started ==="
echo "Consul UI: http://localhost:8500"
echo "Nomad UI:  http://localhost:4646"

# Wait for Nomad to be ready
echo "Waiting for Nomad to be ready..."
sleep 5
nomad server members
nomad node status
