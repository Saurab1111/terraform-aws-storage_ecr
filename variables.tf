variable "repository_name" {
  type        = string
  description = "Name of the ECR repository"
}

variable "image_tag_mutability" {
  type        = string
  description = "Image tag mutability setting"
  default     = "MUTABLE"

  validation {
    condition     = contains(["MUTABLE", "IMMUTABLE"], var.image_tag_mutability)
    error_message = "image_tag_mutability must be either MUTABLE or IMMUTABLE."
  }
}

variable "scan_on_push" {
  type        = bool
  description = "Enable image scanning on push"
  default     = true
}

variable "encryption_type" {
  type        = string
  description = "Encryption type for the repository"
  default     = "AES256"

  validation {
    condition     = contains(["AES256", "KMS"], var.encryption_type)
    error_message = "encryption_type must be either AES256 or KMS."
  }
}

variable "kms_key" {
  type        = string
  description = "KMS key ARN for repository encryption when using KMS"
  default     = ""
}

variable "force_delete" {
  type        = bool
  description = "Force delete the repository even if it contains images"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the repository"
  default     = {}
}

variable "create_lifecycle_policy" {
  type        = bool
  description = "Create a lifecycle policy for image retention"
  default     = true
}

variable "lifecycle_policy_max_image_count" {
  type        = number
  description = "Maximum number of images to retain in lifecycle policy"
  default     = 30
}
