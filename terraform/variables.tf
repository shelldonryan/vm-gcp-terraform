variable "gcp_project_id" {
    description = "ID do projeto no GCP"
    type = string
    default = "singular-backup-414417"
}

variable "gcp_region" {
    description = "Região da GCP"
    type = string
    default = "us-east1"
}

variable "gcp_zone" {
    description = "Zona da GCP"
    type = string
    default = "us-east1-a"
}

variable "gcp_vm_name" {
    description = "Nome da Máquina Virtual"
    type = string
    default = "vm1-easytravel-app"
}