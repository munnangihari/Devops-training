variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}

variable "app_port" {
  description = "Port the application listens on"
  type        = number
  default     = 8000
}

variable "db_port" {
  description = "Port Postgres listens on"
  type        = number
  default     = 5432
}
