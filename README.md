# module-file
Terraform module to create a file on Linux with Ansible

> [!Warning]
> * This module doesn't have resources with a traditional state.
> * Make sure to set var.external_triggers for any changes that require an update other than variables.
> * This module doesn't delete the changes on the target system on destroy.

# Terraform Docs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1, < 2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2, < 3 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3, < 4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3, < 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ansible"></a> [ansible](#provider\_ansible) | 1.3.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.2 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ansible_playbook.file](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [local_file.tmp](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.external](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.file](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.variables](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_uuid.tmp_file_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |

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
| <a name="output_tmp_file_path"></a> [tmp\_file\_path](#output\_tmp\_file\_path) | n/a |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | Trigger for file changes to be used by other null\_resources/modules |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
