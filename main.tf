resource "terraform_data" "file" {
  input = jsonencode({
    hostname          = var.hostname
    content           = var.content
    path              = var.path
    mode              = var.mode
    owner             = var.owner
    group_owner       = var.group_owner != null ? var.group_owner : var.owner
    secontext_role    = var.secontext.role != null ? var.secontext.role : ""
    secontext_type    = var.secontext.type != null ? var.secontext.type : ""
    secontext_user    = var.secontext.user != null ? var.secontext.user : ""
    secontext_level   = var.secontext.level != null ? var.secontext.level : ""
    external_triggers = var.external_triggers
  })

  connection {
    host = jsondecode(self.output).hostname
    user = "root"
  }

  provisioner "file" {
    content     = jsondecode(self.output).content
    destination = jsondecode(self.output).path
  }

  provisioner "remote-exec" {
    when = create
    inline = compact([
      "chown ${jsondecode(self.output).owner}:${jsondecode(self.output).group_owner} ${var.path}",
      "chmod ${jsondecode(self.output).mode} ${jsondecode(self.output).path}",
      jsondecode(self.output).secontext_user != "" ? "chcon -u ${jsondecode(self.output).secontext_user} ${jsondecode(self.output).path}" : null,
      jsondecode(self.output).secontext_role != "" ? "chcon -u ${jsondecode(self.output).secontext_role} ${jsondecode(self.output).path}" : null,
      jsondecode(self.output).secontext_type != "" ? "chcon -u ${jsondecode(self.output).secontext_type} ${jsondecode(self.output).path}" : null,
      jsondecode(self.output).secontext_level != "" ? "chcon -u ${jsondecode(self.output).secontext_level} ${jsondecode(self.output).path}" : null,
    ])
  }

  provisioner "remote-exec" {
    when   = destroy
    inline = ["rm ${jsondecode(self.output).path}"]
  }
}
