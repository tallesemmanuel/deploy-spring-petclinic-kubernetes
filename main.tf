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
  token = "dop_v1_bf9a2173c362a586593effe35eb6dcad0c991a301eacb01da473ce2597c476cd"
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

  
  
  