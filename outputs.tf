output "instance_id" {
  description = "ID of the EC2 instance hosting our 3CX phone system."
  value       = aws_instance.phone_system.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance hosting our 3CX phone system."
  value       = aws_instance.phone_system.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance hosting our 3CX phone system."
  value       = aws_instance.phone_system.public_dns
}

output "instance_state" {
  description = "Current state of the EC2 instance hosting our 3CX phone system."
  value       = aws_instance.phone_system.instance_state
}

output "instance_type" {
  description = "Name of the type of EC2 instance hosting our 3CX phone system."
  value       = aws_instance.phone_system.instance_type
}

output "trunk" {
  value = twilio_trunking_trunks_v1.trunk
}

output "origination_url" {
  value = twilio_trunking_trunks_origination_urls_v1.origination_urls
}

output "pstn_url" {
  value = twilio_trunking_trunks_v1.trunk.domain_name
}