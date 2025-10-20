# terraform-ansible-file
Terraform module to create a file on Linux with Ansible

> [!Warning]
> * This module doesn't have resources with a traditional state.
> * Make sure to set var.external_triggers for any changes that require an update other than variables.
> * This module doesn't delete the changes on the target system on destroy.

# Terraform Docs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [terraform_data.file](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content"></a> [content](#input\_content) | File content; You can use file() or templatefile() to generate from existing local file. | `string` | n/a | yes |
| <a name="input_external_triggers"></a> [external\_triggers](#input\_external\_triggers) | Triggers for rerunning the file playbook except variables | `map(string)` | `{}` | no |
| <a name="input_group_owner"></a> [group\_owner](#input\_group\_owner) | Group owner of the file | `string` | `null` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The hostname of linux machine the file will be created on | `string` | n/a | yes |
| <a name="input_mode"></a> [mode](#input\_mode) | Mode of the file | `string` | `"0600"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner of the file | `string` | `"root"` | no |
| <a name="input_path"></a> [path](#input\_path) | Path of the file | `string` | n/a | yes |
| <a name="input_secontext"></a> [secontext](#input\_secontext) | The secontext for the file | <pre>object({<br>    role  = optional(string, null)<br>    type  = optional(string, null)<br>    user  = optional(string, null)<br>    level = optional(string, null)<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_content"></a> [content](#output\_content) | Content of the file |
| <a name="output_group"></a> [group](#output\_group) | Name of the group owner of the file |
| <a name="output_hostname"></a> [hostname](#output\_hostname) | The hostname of linux machine the file was created on |
| <a name="output_mode"></a> [mode](#output\_mode) | Mode of the file |
| <a name="output_owner"></a> [owner](#output\_owner) | Name of the owner of the file |
| <a name="output_path"></a> [path](#output\_path) | Path of the file |
| <a name="output_secontext"></a> [secontext](#output\_secontext) | The applied secontext for the file |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | Trigger for file changes to be used by other terraform\_data/modules |
<!-- END_TF_DOCS -->
