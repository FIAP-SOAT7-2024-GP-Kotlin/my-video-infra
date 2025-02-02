resource "digitalocean_droplet" "my_video_nats_server" {
  image    = "docker-20-04"
  name     = "my-video-nats-server"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  vpc_uuid = data.digitalocean_vpc.vpc.id
  ssh_keys = [
    data.digitalocean_ssh_key.set_ssh_key.id
  ]

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = self.ipv4_address
      user        = "root"
      private_key = var.ssh_private_key
      timeout     = "30s"
    }

    inline = [
      "docker run -d --name nats-server -p 4222:4222 -p 8222:8222 nats:latest"
    ]
  }
}