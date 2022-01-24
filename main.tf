terraform {
  backend "remote" {
    organization = "renata-corporation"
    workspaces {
      name = "Example-Workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.37.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

// TODO: habilitar depois (as instancias estao off por enquanto. Motivo: dinheiro)

//resource "aws_instance" "app_server" {
//  ami           = "ami-08d70e59c07c61a3a"
//  instance_type = "t2.micro"
//
//  tags = {
//    Name = var.instance_name
//  }
//}
