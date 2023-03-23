module "tags" {
  source = "../../"

  environment = "sandbox"
  owner       = "2023invalid"
  service     = "serviceWithUppercaseLetters"

  extra_tags = {
    keyWithUppercase            = 1
    key_with_underscore         = 1
    "1-key-with-leading-number" = 1
    key-with-trailing-dash-     = 1
  }
}
