resource "aws_codebuild_project" "terraform_codebuild_project" {

  count = length(var.build_projects)

  name           = "${var.project_name}-${var.build_projects[count.index]}"
  service_role   = var.role_arn
  encryption_key = var.kms_key_arn
  tags           = var.tags
  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = var.builder_compute_type
    image                       = var.builder_image
    type                        = var.builder_type
    privileged_mode             = true
    image_pull_credentials_type = var.builder_image_pull_credentials_type

    environment_variable {
      name  = "ECR_URL"
      value = var.ecr_url
    }
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }
  }
  source {
    type      = "CODEPIPELINE"
    buildspec = file("./templates/buildspec_${var.build_projects[count.index]}.yml")
  }
}