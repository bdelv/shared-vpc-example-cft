# --------------------------------------
# Environment: Global
# --------------------------------------
variable "org_id" {
  description = "ID of the Google Cloud organisation"
  type = string
}
variable "billing_account" {
  description = "billing account associated with the created projects"
  type = string
}
variable "folder_id"  {
  description = "root folder id of the deployment"
  type = string
}
# ----------- with defaults
variable "prefix" {
  description = "prefix for the projects names"
  type = string
  default = "testvpc"
}
variable "region" {
  description = "region of the deployment"
  type = string
  default = "us-east1"
}