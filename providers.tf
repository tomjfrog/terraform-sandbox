provider "google" {
  project     = "soleng-dev"
  region      = "us-east1"
  zone        = "us-east1-b"
  credentials = var.GOOGLE_CREDENTIALS
}