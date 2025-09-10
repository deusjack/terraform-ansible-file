#################
# ansible files #
#################

resource "terraform_data" "file" {
  input = filemd5("${path.module}/file.yaml")
}

#####################
# external triggers #
#####################

resource "terraform_data" "external" {
  input = join(",", values(var.external_triggers))
}

#############
# variables #
#############

resource "terraform_data" "variables" {
  input = join(",", values({
    content         = var.content
    path            = var.path
    mode            = var.mode
    owner           = var.owner
    group_owner     = var.group_owner
    secontext_role  = var.secontext.role
    secontext_type  = var.secontext.type
    secontext_user  = var.secontext.user
    secontext_level = var.secontext.level
  }))
}
