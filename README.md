# Infrastructure 

## Hardware 
  - Mini pc (hp elitebook/prodesk, thinkcentre or similar)
  - Lenovo thinkpad laptop 
  - Macbook pro m3 pro 

## Network 
  - Existing home router 
  - 

## Virtualization Layer 

### Proxmox 

VMs: 
1. Nomad-control 
  - Ubuntu 
  - orchestrates workloads, services and other jobs 

2. Storage 
  - TrueNAS 

3. Nomad-static 
  - Static nomad node for running core services 

## Nomad 
### Clients 
1. Nomad-control (static)
2. Thinkpad (compute, dynamic)
3. Macbook pro m3 pro (compute, dynamic) 



## Services 
Deployed via Nomad 

### Core Networking 
- VPN (proton)
- Remote access 

### Media stack 

- *arr stack 
- Jellyfin
- Jellyseer 

### Mlflow tracking server 

- Components 
  1. Mlflow tracking server 
  2. Artifact store: Database or bucket 
  3. Backend store: Database 



