variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the Redis subnet group"
  type        = list(string)
}

variable "app_sg_id" {
  description = "App tier security group allowed to reach Redis"
  type        = string
}

variable "redis_port" {
  type    = number
  default = 6379
}

variable "node_type" {
  type    = string
  default = "cache.t3.micro"
}
