  terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}
variable "nome_cluster" {}


# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name   = var.nome_cluster
  region = "nyc1"
  version = "1.22.8-do.1"

  node_pool {
    name       = "default"
    size       = "s-2vcpu-2gb"
    node_count = 3

  }

}

  
  
  