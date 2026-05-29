output "orquestador_instance_id" {
  description = "ID de la instancia EC2 desplegada a través del módulo remoto"
  value       = module.computo.instance_id
}

output "orquestador_instance_public_ip" {
  description = "IP pública de la instancia EC2 para acceso web o SSH"
  value       = module.computo.instance_ip
}

output "orquestador_vpc_id" {
  description = "ID de la VPC base creada por el módulo de redes"
  value       = module.redes.vpc_id
}