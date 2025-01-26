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
3. Create your python venv for lints:
  ```bash
      python3.10 -m venv env
      source env/bin/activate
      pip install ansible ansible-lint pylint checkov pymysql mysqlclient
  ```
4. Run the playbook locally using Ansible:
   ```bash
      ansible-playbook -i inventory.yml playbook.yml --extra-vars "mariadb_root_password=Super-secure_root_password"
   ```

## Access
- PowerDNS listens on port `53` (UDP and TCP).
- PowerDNS-Admin is accessible via `http://<server-ip>:9191`.

## Lints used
- shellcheck: It detects syntax errors, security issues, and common pitfalls in Bash, sh, and other interpreters.
  ```bash
     apt install -yqq shellcheck
     shellcheck local/install.sh
  ```
     
