terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = ""
}

resource "digitalocean_kubernetes_cluster" "kubernetes" {
  name   = "k8s"
  region = "nyc1"
  version = "1.22.8-do.1"

  node_pool {
    name       = "default"
    size       = "s-2vcpu-4gb"
    node_count = 3

  }

}

  
  
  