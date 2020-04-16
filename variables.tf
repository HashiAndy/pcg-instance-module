variable "tag_name" {
  type = string
}
variable "tag_ttl" {
  type = string
}
variable "tag_owner" {
  type = string
}
variable "os" {
  type = string
  default = "ubuntu"
}
variable "size" {
  type = string
  default = "t2.small"
}
