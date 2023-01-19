# The aws_codestarconnections_connection resource is created in the state PENDING. 
# Authentication with the connection provider must be completed in the AWS Console.
resource "aws_codestarconnections_connection" "this" {

  name          = "${var.project_name}-cs"
  provider_type = var.git_provider_type
}


resource "aws_codepipeline" "terraform_pipeline" {
  for_each = { for git_repo in var.git_repo_list : git_repo.id => git_repo }

  name     = "${var.project_name}-${each.value.id}-pipeline"
  role_arn = var.codepipeline_role_arn
  tags     = var.tags

  artifact_store {
    location = var.s3_bucket_name
    type     = "S3"
    encryption_key {
      id   = var.kms_key_arn
      type = "KMS"
    }
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source"]

      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.this.arn
        FullRepositoryId = "${each.value.owner}/${each.value.repo_name}"
        BranchName       = each.value.branch
      }
    }
  }

  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      version          = "1"
      provider         = "CodeBuild"
      input_artifacts  = ["source"]
      output_artifacts = ["buildout"]
      run_order        = 1
      configuration = {
        ProjectName = "${var.project_name}-build"
        EnvironmentVariables = <<EOF
[{"name":"SERVICE_NAME","type":"PLAINTEXT","value":"${each.value.repo_name}"}]
EOF
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name             = "Deploy"
      category         = "Build"
      owner            = "AWS"
      version          = "1"
      provider         = "CodeBuild"
      input_artifacts  = ["buildout"]
      output_artifacts = ["deployout"]
      run_order        = 2
      configuration = {
        ProjectName = "${var.project_name}-deploy"
      }
    }
  }
}