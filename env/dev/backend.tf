terraform {
  backend "gcs" {
    bucket = "tf-state-dev-testing-puneeth"
    prefix = "landing-zone"
  }
}
