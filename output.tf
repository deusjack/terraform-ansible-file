output "triggers" {
  value = {
    file = terraform_data.file
  }
  description = "Trigger for file changes to be used by other terraform_data/modules"
}

output "content" {
  value       = jsondecode(terraform_data.file.output).content
  description = "Content of the file"
  sensitive   = true # Just in case
}

output "hostname" {
  value       = jsondecode(terraform_data.file.output).hostname
  description = "The hostname of linux machine the file was created on"
}

output "path" {
  value       = jsondecode(terraform_data.file.output).path
  description = "Path of the file"
}

output "mode" {
  value       = jsondecode(terraform_data.file.output).mode
  description = "Mode of the file"
}

output "owner" {
  value       = jsondecode(terraform_data.file.output).owner
  description = "Name of the owner of the file"
}

output "group" {
  value       = jsondecode(terraform_data.file.output).group_owner
  description = "Name of the group owner of the file"
}

output "secontext" {
  value = {
    user  = jsondecode(terraform_data.file.output).secontext_user
    role  = jsondecode(terraform_data.file.output).secontext_role
    type  = jsondecode(terraform_data.file.output).secontext_type
    level = jsondecode(terraform_data.file.output).secontext_level
  }
  description = "The applied secontext for the file"
}
