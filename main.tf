# ------------------------------------------------------------------------------
# STANDARD TAGS
# ------------------------------------------------------------------------------

locals {
  tags = {
    created-by  = "terraform"
    environment = var.environment
    owner       = var.owner
    service     = var.service
  }

  tags_for_asg = [
    for k, v in local.tags :
    {
      key                 = k
      value               = v
      propagate_at_launch = true
    }
  ]
}
