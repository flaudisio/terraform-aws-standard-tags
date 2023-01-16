module "tags" {
  source = "../../"

  environment = "development"
  service     = "tf-examples"
  owner       = "infra"
}
