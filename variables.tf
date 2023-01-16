variable "environment" {
  description = "The environment name"
  type        = string

  validation {
    condition     = contains(["development", "production"], var.environment)
    error_message = "The environment name must be 'development' or 'production' (case sensitive)."
  }
}

variable "service" {
  description = "The name of the service related to the component"
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]*[a-z0-9]$", var.service))
    error_message = "The service name must start with a lower case letter and can only contain lower case letters, numbers and dashes (-)."
  }
}

variable "owner" {
  description = "The name of the component owner"
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]*[a-z0-9]$", var.owner))
    error_message = "The owner name must start with a lower case letter and can only contain lower case letters, numbers and dashes (-)."
  }
}
