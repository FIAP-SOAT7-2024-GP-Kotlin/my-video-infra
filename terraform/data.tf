data "digitalocean_vpc" "vpc" {
  region = "nyc1"
}

data "digitalocean_ssh_key" "set_ssh_key" {
  name = var.do_ssh_key_name
}