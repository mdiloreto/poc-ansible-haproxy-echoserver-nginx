# Docker-based Web Application PoC Deployment

## Overview

This project provides the necessary Ansible playbooks and Terraform configuration to deploy a Proof of Concept (PoC) infrastructure capable of supporting a web application development lifecycle. The setup includes a load balancer, simulated API responses, and static content serving, all deployed using Docker containers on Google Cloud Platform (GCP).

## Project Components

### 1. Base System

- **Terraform Configuration**: The project includes Terraform code to provision a virtual machine (VM) in GCP. This VM serves as the base system for running Docker containers.
- **Ansible Playbook**: An Ansible playbook is used to install Docker and Docker Compose on the VM, and to deploy the containerized applications.

### 2. Application Setup

#### API Application

- **EchoServer**: The Ansible playbook deploys a Docker container running the `gcr.io/google_containers/echoserver:1.8` image. This container simulates API responses for requests prefixed with `/api`.

#### Static Content Application

- **Nginx**: Another Docker container runs the `nginx:latest` image, serving static content for requests prefixed with `/statics`. Each Nginx instance responds with a message indicating the server handling the request.

### 3. Load Balancer
- **HAProxy**: The project includes a Docker container running `haproxy:3.0.3`, which balances incoming traffic based on predefined rules:
  - Requests prefixed with `/api` are routed to the EchoServer containers.
  - Requests prefixed with `/statics` are routed to the Nginx containers.
  - Requests with the path `/statics/path` are consistently routed to the same Nginx server for session persistence.

### 4. Scaling
- **Flexible Scaling**: The Ansible configuration allows scaling the number of EchoServer and Nginx containers based on variables. Each Nginx server responds with a unique server ID, facilitating easy identification.

## CI/CD Pipeline

The project includes a fully automated CI/CD pipeline that deploys both the Terraform and Ansible code to GCP. The deployment is live, and you can test it using the following URLs:

- **Static Content**: [URL for Static Content]
- **Path Content**: [URL for Path Content]
- **API**: [URL for API]

## Execution

### Prerequisites
- Ensure you have Terraform and Ansible installed on your local machine.
- Set up your GCP credentials to allow Terraform to provision resources.

### Steps to Deploy
1. Clone the repository to your local machine.
2. Run `terraform init` and `terraform apply` to provision the VM on GCP.
3. The Ansible playbooks will automatically execute as part of the Terraform provisioning process, setting up Docker, deploying the containers, and configuring HAProxy.

### Restarting HAProxy
The Ansible playbook is designed to restart the HAProxy service automatically whenever a configuration change is detected. This ensures that any updates to the HAProxy configuration are applied seamlessly.

## Feedback and Discussion

This project was completed in approximately 6-8 hours, including the setup of Ansible, Terraform, and the CI/CD pipeline. If you have any feedback or would like to discuss the implementation further, I would be happy to schedule a feedback session.

## Conclusion
This project provides a robust foundation for deploying and managing a web application development environment using Docker, Ansible, and Terraform. It demonstrates best practices in configuration management, scalability, and load balancing on GCP.
