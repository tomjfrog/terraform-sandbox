# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "tomj-artifactory-4" {
  provider = google

  boot_disk {
    auto_delete = true
    device_name = "tomj-artifactory-01"

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20221201"
      size  = 40
      type  = "pd-ssd"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    custodian_label = "to_restart"
    ec-src          = "vm_add-tf"
    owner           = "tomj"
    purpose         = "lab"
    team            = "soleng"
  }

  machine_type = "e2-custom-2-9728"

  metadata = {
    ssh-keys = var.gcloud_ssh_key
  }

  name = "tomj-artifactory-4"

  network_interface {
    subnetwork = "projects/soleng-dev/regions/us-east1/subnetworks/us-staging-app-layer-3"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }


  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["tomj-allow-artifactory-ui-in", "us-staging-allow-internal-in", "us-staging-allow-internal-out"]
  zone = "us-east1-b"
}
