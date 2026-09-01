terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-monster-devops"
}

resource "kubernetes_namespace" "monster" {
  metadata {
    name = "monster-devops"
  }
}
