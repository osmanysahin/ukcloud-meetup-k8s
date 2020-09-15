terraform {
  backend "gcs" {
    credentials = "./terraform-gke-keyfile.json"
    bucket      = "meetup-terraform-state"
    prefix      = "tf/tfstate"
  }
}