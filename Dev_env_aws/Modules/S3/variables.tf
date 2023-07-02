variable "s3_bucket_name" {
    type = string
    default = null
}
/*variable "acl"{ 
    type        = string
  default     = "private"
  }  */
variable "s3_versioning" {
     type = string
    default = "enabled"
}
variable "enable_lifecycle_rule" {
    type        = bool
  default     = false
}