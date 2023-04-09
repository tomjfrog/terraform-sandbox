variable "gcloud_ssh_key" {
  type        = string
  description = "Public SSH Key of the Bastion Host"
  sensitive   = true
}
