resource "random_uuid" "tmp_file_name" {}

resource "local_file" "tmp" {
  filename = "${path.module}/files/tmp/${random_uuid.tmp_file_name.result}"
  content  = var.content
}

resource "ansible_playbook" "file" {
  depends_on              = [local_file.tmp]
  name                    = var.hostname
  playbook                = "${path.module}/file.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = merge(
    {
      src_path         = "tmp/${random_uuid.tmp_file_name.result}"
      dest_path        = var.path
      file_mode        = var.mode
      file_owner       = var.owner
      file_group_owner = var.group_owner != null ? var.group_owner : var.owner
    },
    var.secontext.user != null ? { file_seuser = var.secontext.user } : {},
    var.secontext.role != null ? { file_serole = var.secontext.role } : {},
    var.secontext.type != null ? { file_setype = var.secontext.type } : {},
    var.secontext.level != null ? { file_selevel = var.secontext.level } : {}
  )
  lifecycle {
    replace_triggered_by = [
      terraform_data.file,
      terraform_data.external,
      terraform_data.variables
    ]
  }
}
