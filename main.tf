provider "aws" {
  region = var.aws_region
}

# Invocación Remota Inmutable - Módulo de Redes (Equivalente estricto a v0.2.0)
module "redes" {
  source = "git::https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-redes.git?ref=66612180864f4dea43b53237f4cb14b5aa690e36"
}

# Invocación Remota Inmutable - Módulo de Cómputo (Equivalente estricto a v0.2.0)
module "computo" {
  source        = "git::https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-computo.git?ref=987fde869ac3262e3947537cde25836f7ba372c3"
  project_name  = var.project_name
  instance_type = var.instance_type
  ami_id        = var.ami_id

  # Enlace dinámico de dependencias
  subnet_id = module.redes.subnet_ids[0]
}