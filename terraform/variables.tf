variable "gcp_project_id" {
    description = "ID do projeto no GCP"
    type = string
    default = "easytravelapp-457301"
}

variable "gcp_region" {
    description = "Região da GCP"
    type = string
    default = "us-east1"
}

variable "gcp_zone" {
    description = "Zona da GCP"
    type = string
    default = "us-east1-b"
}

variable "gcp_vm_name" {
    description = "Nome da Máquina Virtual"
    type = string
    default = "vm1-easytravel-app"
}