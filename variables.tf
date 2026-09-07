variable "repository_name" {
  description = "Name of the ECR repository."
  type        = string
  default     = "app-container-repo"
}

variable "image_tag_mutability" {
  description = "Image tag mutability setting for the repository."
  type        = string
  default     = "IMMUTABLE"

  validation {
    condition     = contains(["MUTABLE", "IMMUTABLE"], var.image_tag_mutability)
    error_message = "image_tag_mutability must be MUTABLE or IMMUTABLE."
  }
}

variable "scan_on_push" {
  description = "Enable image scanning on push."
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "Encryption type for the repository."
  type        = string
  default     = "AES256"

  validation {
    condition     = contains(["AES256", "KMS"], var.encryption_type)
    error_message = "encryption_type must be AES256 or KMS."
  }
}

variable "kms_key" {
  description = "KMS key ARN to use when encryption type is KMS."
  type        = string
  default     = ""
}

variable "force_delete" {
  description = "Force delete the repository even if it contains images."
  type        = bool
  default     = false
}

variable "repository_policy" {
  description = "JSON formatted IAM policy for the repository."
  type        = string
  default     = ""
}

variable "lifecycle_policy" {
  description = "JSON formatted lifecycle policy for image cleanup."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the repository."
  type        = map(string)
  default = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
