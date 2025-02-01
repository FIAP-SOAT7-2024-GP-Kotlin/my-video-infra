resource "digitalocean_droplet" "my_video_nats_server" {
  image    = "docker-20-04"
  name     = "my-video-nats-server"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  vpc_uuid = data.digitalocean_vpc.vpc.id
  ssh_keys = [43452957, 43405929]
}

resource "null_resource" "install_nats" {
  provisioner "remote-exec" {
    inline = [
      "docker run -d --name nats-server -p 4222:4222 -p 8222:8222 nats:latest"
    ]

    connection {
      type        = "ssh"
      host        = digitalocean_droplet.my_video_nats_server.ipv4_address
      user        = "root"
      private_key = file(var.ssh_private_key)
      timeout     = "30s"
    }
  }
}