variable "aws_region" {
  description = "Región de AWS donde se desplegará toda la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nombre del proyecto utilizado para taguear y organizar los recursos"
  type        = string
  default     = "EVP-IaC-Orquestador"
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servidor de cómputo"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI de Amazon Linux 2023 idónea para la región us-east-1"
  type        = string
  default     = "ami-051f7e7f6c2f40dc1" # Verifica si en tu AWS Academy se sugiere otra, esta es la estándar de AL2023
}