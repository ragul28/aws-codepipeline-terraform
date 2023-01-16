output "id" {
  value       = values(aws_codepipeline.terraform_pipeline)[*].id
  description = "The id of the CodePipeline"
}

output "name" {
  value       = values(aws_codepipeline.terraform_pipeline)[*].name
  description = "The name of the CodePipeline"
}
