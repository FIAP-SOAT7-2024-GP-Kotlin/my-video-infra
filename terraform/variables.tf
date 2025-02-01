variable "do_token" {
  type = string
}

variable "ssh_private_key" {
  description = "Conteúdo da chave privada SSH"
  type        = string
  # sensitive   = true
}