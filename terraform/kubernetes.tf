resource "digitalocean_kubernetes_cluster" "my_video_kubernetes_cluster" {
  name     = "my-video-k8s"
  region   = "nyc1"
  version  = "1.32.1-do.0"
  vpc_uuid = data.digitalocean_vpc.vpc.id

  node_pool {
    name       = "my-video-node-pool"
    size       = "s-2vcpu-4gb"
    node_count = 1
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }
}