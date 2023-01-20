variable "aws_region" {}
variable "profile" {}

variable "project_name" {
  description = "Unique name for this project"
  type        = string
}

variable "create_new_repo" {
  description = "Whether to create a new repository. Values are true or false. Defaulted to true always."
  type        = bool
  default     = true
}

variable "create_new_role" {
  description = "Whether to create a new IAM Role. Values are true or false. Defaulted to true always."
  type        = bool
  default     = true
}

variable "codepipeline_iam_role_name" {
  description = "Name of the IAM role to be used by the Codepipeline"
  type        = string
  default     = "codepipeline-role"
}

# variable "git_owner" {}
# variable "git_repo" {}
# variable "git_repo_branch" {}

variable "git_repo_list" {
  type = list(map(any))
}

variable "git_provider_type" {
  description = "Codestar connections support; GitHub, Bitbucket"
  default     = "GitHub"
}

variable "environment" {
  description = "Environment in which the script is run. Eg: dev, prod, etc"
  type        = string
}

variable "build_projects" {
  description = "Tags to be attached to the CodePipeline"
  type        = list(string)
}

variable "builder_compute_type" {
  description = "Relative path to the Apply and Destroy build spec file"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "builder_image" {
  description = "Docker Image to be used by codebuild"
  type        = string
  default     = "aws/codebuild/standard:6.0"
}

variable "builder_type" {
  description = "Type of codebuild run environment"
  type        = string
  default     = "LINUX_CONTAINER"
}

variable "builder_image_pull_credentials_type" {
  description = "Image pull credentials type used by codebuild project"
  type        = string
  default     = "CODEBUILD"
}

variable "build_project_source" {
  description = "aws/codebuild/standard:6.0"
  type        = string
  default     = "CODEPIPELINE"
}

variable "ecr_url" {
  description = "ECR url to push docker image"
  type        = string
}