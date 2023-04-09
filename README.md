# terraform-sandbox
Let's get started with Terraform

## Providers
### GCP
#### Authentication
To authenticate to GCP from Terraform Cloud:
1. Place your credentials in a Terraform Cloud environment variable
  1. Create an environment variable called GOOGLE_CREDENTIALS in your Terraform Cloud workspace.
  1. Remove the newline characters from your JSON key file and then paste the credentials into the environment variable value field. You can use the tr command to strip newline characters. cat key.json | tr -s '\n' ' '
  1. Mark the variable as Sensitive and click Save variable.

2. All runs within the workspace will use the GOOGLE_CREDENTIALS variable to authenticate with Google Cloud Platform.