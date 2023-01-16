output "tags" {
  description = "A map with all defined tags"
  value       = local.tags
}

output "tags_for_asg" {
  description = "A list of maps containing the defined tags for using with an Auto Scaling Group"
  value       = local.tags_for_asg
}
