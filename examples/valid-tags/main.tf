module "tags" {
  source = "../../"

  environment = "development"
  service     = "tf-examples"
  owner       = "infra"

  extra_tags = {
    extra             = 1
    key-with-dash     = "true"
    key-with-1-number = "example"
  }
}
