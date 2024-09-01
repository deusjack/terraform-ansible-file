variable "external_triggers" {
  type        = map(string)
  description = "Triggers for rerunning the directory playbook except variables"
  default     = {}
}

# Doesn't need a trigger. On change the playbooks is automatically replaced.
variable "hostname" {
  type        = string
  description = "The hostname of linux machine the file will be created on"
}

variable "content" {
  type        = string
  description = "File content; You can use file() or templatefile() to generate from existing local file."
  sensitive   = true # Just in case
}

variable "path" {
  type        = string
  description = "Path of the file"
}

variable "mode" {
  type        = string
  description = "Mode of the file"
  default     = "0600"
}

variable "owner" {
  type        = string
  description = "Owner of the file"
  default     = "root"
}

variable "group_owner" {
  type        = string
  description = "Group owner of the file"
  default     = null
}

variable "secontext" {
  type = object({
    role  = optional(string, null)
    type  = optional(string, null)
    user  = optional(string, null)
    level = optional(string, null)
  })
  description = "The secontext for the file"
}
