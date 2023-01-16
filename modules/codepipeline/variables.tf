variable "project_name" {
  description = "Unique name for this project"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name to be used for storing the artifacts"
  type        = string
}

variable "codepipeline_role_arn" {
  description = "ARN of the codepipeline IAM role"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
}

variable "tags" {
  description = "Tags to be attached to the CodePipeline"
  type        = map(any)
}

variable "git_provider_type" {
  description = "Codestar connections support; GitHub, Bitbucket"
  default     = "GitHub"
}

# variable "git_owner" {}
# variable "git_repo" {}
# variable "git_repo_branch" {}

variable "git_repo_list" {
  type = list(map(any))
}