variable "image_name" {
  type        = string
  description = "Docker image to deploy"
}

variable "app_name" {
  type    = string
  default = "react-app"
}
