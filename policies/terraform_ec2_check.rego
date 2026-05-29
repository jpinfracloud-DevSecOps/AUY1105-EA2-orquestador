package terraform.ec2

import future.keywords.in

default violation = set()

violation[msg] {
    some change in input.resource_changes
    change.type == "aws_instance"
    
    some action in change.change.actions
    action in ["create", "update"]
    
    instance_type := change.change.after.instance_type
    instance_type != "t2.micro"
    
    msg := sprintf("POLITICA RECHAZADA: La instancia '%v' esta configurada como '%v'. Solo se permite el tipo 't2.micro' por politicas de la EVA2.", [change.name, instance_type])
}