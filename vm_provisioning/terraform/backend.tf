terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>5.0.0"
    }
  }
  
  backend "gcs" {
    bucket = "multiclouds14240"
    prefix = "haproxy-poc"

  }
}