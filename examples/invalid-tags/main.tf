module "tags" {
  source = "../../"

  environment = "sandbox"
  service     = "serviceWithUppercaseLetters"
  owner       = "2023invalid"
}
