output "tags" {
  description = "A map with all defined tags"
  value       = module.tags.tags
}

output "tags_for_asg" {
  description = "A list of maps containing the defined tags for using with an Auto Scaling Group"
  value       = module.tags.tags_for_asg
}
