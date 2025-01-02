# PowerDNS and MariaDB Deployment

This repository provides a professional deployment of a DNS server using PowerDNS with MariaDB as the backend. It offers two deployment options:
1. **Host-based deployment**: Install directly on the host using Ansible roles.
2. **Docker-in-Docker (DinD) deployment**: Use Docker Compose within a DinD container.

## Features
- DNS server with MariaDB backend.
- Two deployment options for flexibility.
- Fully automated CI/CD pipelines with GitHub Actions.
- Code quality checks with ansible-lint and Checkov.

## Project Structure
- **ansible/**: Contains Ansible roles and playbooks for deployment.
- **docker/**: Dockerfiles and Docker Compose configurations.
- **pipelines/**: CI/CD configurations for GitHub Actions.

## Usage
### Prerequisites
- Ansible installed on your control node.
- Python 3 with pip for dependency management.

### Steps
1. Clone this repository.
2. Choose a deployment method (Host or DinD).
3. Run the Ansible playbook for your chosen method.

## License
This project is licensed under the MIT License.
