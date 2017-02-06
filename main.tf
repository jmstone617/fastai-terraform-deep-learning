provider "aws" {
  region = "us-west-2"
}

module "aws" {
  source = "./aws"

  ssh_key_name = "key_name"
  ssh_key_path = "/full/path/to/key_name.pem"
  region = "us-west-2"
}
