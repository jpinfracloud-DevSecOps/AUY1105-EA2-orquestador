provider "aws" {
  region = var.aws_region
}

# 1. Invocación Remota del Módulo de Redes (Actualizado a v0.2.0 con Gobernanza SSH)
module "redes" {
  source = "git::https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-redes.git?ref=v0.2.0"
}

# 2. Invocación Remota del Módulo de Cómputo (Actualizado a v0.2.0 con Gobernanza Costos)
module "computo" {
  source        = "git::https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-computo.git?ref=v0.2.0"
  project_name  = var.project_name
  instance_type = var.instance_type
  ami_id        = var.ami_id
  
  # Corrección técnica: Extraemos el primer elemento [0] de la lista 'subnet_ids'
  subnet_id     = module.redes.subnet_ids[0]
}