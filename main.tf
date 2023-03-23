# ------------------------------------------------------------------------------
# STANDARD TAGS
# ------------------------------------------------------------------------------

locals {
  tags = merge(
    {
      created-by   = "terraform"
      environment  = var.environment
      owner        = var.owner
      service-name = var.service
    },
    var.extra_tags
  )

  tags_for_asg = [
    for k, v in local.tags :
    {
      key                 = k
      value               = v
      propagate_at_launch = true
    }
  ]
}
