terraform {
  required_version = ">=1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.40, < 4.0"
    }
    curl = {
      source  = "anschoewe/curl"
      version = "1.0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
}

terraform {
  backend "azurerm" {
    storage_account_name = "tfbackendaks"
    container_name       = "tfstate"
    access_key           = "U6pngCQp5zOn4ocdUNCGJFTpOFjw5IIVftuft66QmWkQ9ecRTOUV7OPqsyQRJNH3OuA+0v3LaZSd+AStwz5opQ=="
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  client_id       = "cdcd4d34-3d32-4825-8632-8e49d30c4af8"
  client_secret   = "8g48Q~mgX-~zQXSWuNqPKRfKwnv3dMSAcPqqGc2h"
  tenant_id       = "a851c1e7-3d0a-4c96-884c-5a9a7987980b"
  subscription_id = "9ee5c276-4d4a-4167-9acb-433e64cf3f0f"
  features {}
}

provider "curl" {}

provider "random" {}