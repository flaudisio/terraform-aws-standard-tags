module "tags" {
  source = "../../"

  environment = "development"
  owner       = "infra"
  service     = "tf-examples"

  extra_tags = {
    extra                     = 1
    key-with-dash             = true
    key-with-1-number         = "example"
    key-with-trailing-number1 = "another"
  }
}
