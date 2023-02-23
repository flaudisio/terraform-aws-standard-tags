# Standard tags for AWS resources module

Terraform module to create standardized tags for AWS resources.

## Usage

This module has two main usage scenarios:

- [Typical AWS resources](#typical-aws-resources)
- [Auto Scaling Groups](#auto-scaling-group)

### Typical AWS resources

```hcl
module "tags" {
  source  = "flaudisio/standard-tags/aws"
  version = "0.2.0"

  environment = "development"
  service     = "blog"
  owner       = "marketing"
}

resource "aws_security_group" "this" {
  name = "blog-load-balancer"
  # ...

  tags = module.tags.tags
}
```

### Auto Scaling Group

```hcl
module "tags" {
  source  = "flaudisio/standard-tags/aws"
  version = "0.2.0"

  environment = "production"
  service     = "cart-backend"
  owner       = "backend-team"
}

resource "aws_autoscaling_group" "this" {
  name = "example"
  # ...

  tags = module.tags.tags_for_asg
}

```

## How to use this module?

- See the [examples](examples) folder for sample usage.
- See [variables.tf](variables.tf) for all the variables supported by this module.

## Tests

See the [test](test) folder for details.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The name of the component owner | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | The name of the service related to the component | `string` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | A map of optional extra tags to be validated and included in the output | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tags"></a> [tags](#output\_tags) | A map with all defined tags |
| <a name="output_tags_for_asg"></a> [tags\_for\_asg](#output\_tags\_for\_asg) | A list of maps containing the defined tags for using with an Auto Scaling Group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
