terraform {
  required_version = ">= 1.8"
  required_providers {
    ansible = {
      source  = "ansible/ansible"
      version = ">= 1, < 2"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2, < 3"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3, < 4"
    }
  }
}
