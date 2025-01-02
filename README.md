# PowerDNS and PowerDNS-Admin Deployment

This repository provides a professional deployment of a DNS server using PowerDNS, PowerDNS-Admin as the frontend, and MariaDB as the backend. It offers flexibility with two deployment options:

1. **Host-based deployment**: Install directly on the host using Ansible roles.
2. **Docker-in-Docker (DinD) deployment**: Use Docker Compose within a DinD container.

## Features
- DNS server with a web-based admin panel (PowerDNS-Admin).
- MariaDB as the backend database.
- CI/CD pipelines for code quality checks and deployment.

## Project Structure
- **ansible/**: Contains Ansible roles and playbooks for deployment.
- **docker/**: Docker Compose configurations for PowerDNS and PowerDNS-Admin.
- **pipelines/**: CI/CD configurations for GitHub Actions.

## Prerequisites
- Ubuntu 22.04 as the target server.
- Python 3 installed on the control node for Ansible.
- Docker and Docker Compose on the target server.

## Usage
1. Clone this repository.
2. Configure the inventory file (`inventory.yml`) for your server's IP and credentials.
3. Run the playbook using Ansible:
   ```bash
      ansible-playbook /root/powerdns-cicd-stack/ansible/install.yml \
        -i 192.168.1.55, \
        --private-key ~/.ssh/id_rsa.pub
   ```

## Access
- PowerDNS listens on port `53` (UDP and TCP).
- PowerDNS-Admin is accessible via `http://<server-ip>:9191`.
