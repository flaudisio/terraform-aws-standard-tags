module "tags" {
  source = "../../"

  environment = "sandbox"
  service     = "serviceWithUppercaseLetters"
  owner       = "2023invalid"

  extra_tags = {
    keyWithUppercase            = 1
    key_with_underscore         = 1
    "1-key-with-leading-number" = 1
    key-with-trailing-dash-     = 1
  }
}
