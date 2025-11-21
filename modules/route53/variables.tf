variable "project_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

# A records
variable "a_records" {
  type    = list(object({
    name    = string
    ttl     = number
    records = list(string)
  }))
  default = []
}

# CNAME records
variable "cname_records" {
  type    = list(object({
    name  = string
    ttl   = number
    value = string
  }))
  default = []
}

# TXT records
variable "txt_records" {
  type    = list(object({
    name    = string
    ttl     = number
    records = list(string)
  }))
  default = []
}

# MX records
variable "mx_records" {
  type    = list(object({
    name    = string
    ttl     = number
    records = list(string)
  }))
  default = []
}
