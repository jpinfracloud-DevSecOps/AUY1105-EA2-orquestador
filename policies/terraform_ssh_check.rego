package terraform.ssh

import future.keywords.in

default violation = set()

violation[msg] {
    some change in input.resource_changes
    change.type == "aws_security_group"
    
    some action in change.change.actions
    action in ["create", "update"]
    
    some ingress in change.change.after.ingress
    ingress.from_port <= 22
    ingress.to_port >= 22
    
    some cidr in ingress.cidr_blocks
    cidr == "0.0.0.0/0"
    
    msg := sprintf("SEGURIDAD RECHAZADA: El Security Group '%v' permite SSH (puerto 22) desde 0.0.0.0/0. Esto viola la politica de seguridad de la EVA2.", [change.name])
}