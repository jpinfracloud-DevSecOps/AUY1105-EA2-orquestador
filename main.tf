provider "aws" {
  region = var.aws_region
}

# checkov:skip=CKV_TF_1: Se utiliza versionamiento semantico explicito por diseño de arquitectura para la EVA2.
module "redes" {
  source = "git::https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-redes.git?ref=v0.2.0"
}

# checkov:skip=CKV_TF_1: Se utiliza versionamiento semantico explicito por diseño de arquitectura para la EVA2.
module "computo" {
  source        = "git::https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-computo.git?ref=v0.2.0"
  project_name  = var.project_name
  instance_type = var.instance_type
  ami_id        = var.ami_id

  # Corrección técnica: Extraemos el primer elemento [0] de la lista 'subnet_ids'
  subnet_id = module.redes.subnet_ids[0]
}