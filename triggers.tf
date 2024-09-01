#################
# ansible files #
#################

resource "null_resource" "file" {
  triggers = {
    directory = filemd5("${path.module}/file.yaml")
  }
}

#####################
# external triggers #
#####################

resource "null_resource" "external" {
  triggers = var.external_triggers
}

#############
# variables #
#############

resource "null_resource" "variables" {
  triggers = {
    content         = var.content
    path            = var.path
    mode            = var.mode
    owner           = var.owner
    group_owner     = var.group_owner
    secontext_role  = var.secontext.role
    secontext_type  = var.secontext.type
    secontext_user  = var.secontext.user
    secontext_level = var.secontext.level
  }
}
