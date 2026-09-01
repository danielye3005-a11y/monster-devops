
# Monster DevOps Project

A production-style DevOps portfolio project demonstrating the complete lifecycle of a containerized Python application.

## Project Overview

This project demonstrates how an application can be developed, tested, containerized, deployed to Kubernetes, monitored, and managed using Infrastructure as Code.

The application is a simple Flask service used as the workload for the DevOps infrastructure.

## Architecture

Developer
   |
   v
GitHub Repository
   |
   v
GitHub Actions CI
   |
   +--> Run automated tests
   +--> Build Docker image
   +--> Push image to GHCR
             |
             v
        Kubernetes (k3d)
             |
             v
          Helm Chart
             |
       +-----+-----+
       |           |
       v           v
   Flask App    Service/Ingress
       |
       v
   /metrics
       |
       v
   Prometheus
       |
       v
     Grafana

Terraform is used to manage Kubernetes infrastructure resources using Infrastructure as Code.

## Technologies

- Linux / Ubuntu
- Bash
- Git
- GitHub
- Python
- Flask
- Pytest
- Docker
- Docker Compose
- GitHub Actions
- GitHub Container Registry (GHCR)
- Kubernetes
- k3d
- Helm
- Terraform
- Prometheus
- Grafana

## Application

The Flask application exposes:

- `/` - application endpoint
- `/health` - health endpoint
- `/metrics` - Prometheus metrics endpoint

## CI Pipeline

GitHub Actions automatically:

1. Checks out the source code
2. Installs Python dependencies
3. Runs automated tests
4. Builds the Docker image
5. Authenticates to GHCR
6. Pushes the Docker image to GHCR

## Kubernetes

The application is deployed to Kubernetes with:

- Multiple application replicas
- ClusterIP Service
- Ingress
- Readiness probes
- Liveness probes
- CPU and memory requests
- CPU and memory limits

## Helm

A custom Helm chart manages the Kubernetes application deployment.

Configuration such as replica count, image, service ports, ingress host, and resource limits is controlled through `values.yaml`.

## Monitoring

The monitoring stack uses:

- Prometheus
- Grafana
- kube-prometheus-stack
- ServiceMonitor

The Flask application exposes custom Prometheus metrics through `/metrics`.

Prometheus automatically discovers and scrapes the application using a Kubernetes ServiceMonitor.

Grafana is used to visualize the application metrics.

## Infrastructure as Code

Terraform is used to manage Kubernetes infrastructure resources.

Terraform concepts demonstrated in this project include:

- Providers
- Resources
- Terraform State
- `terraform init`
- `terraform plan`
- `terraform apply`
- Infrastructure dependencies
- Idempotent infrastructure management

## Security

Sensitive Terraform state files and local development files are excluded from Git.

Secrets and credentials must never be committed to the repository.

## Project Goal

The goal of this project is to demonstrate practical DevOps skills by combining CI, containers, Kubernetes, Infrastructure as Code, and observability into one end-to-end project.
