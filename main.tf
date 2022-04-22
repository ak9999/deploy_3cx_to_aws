terraform {
  required_providers {
    twilio = {
      source  = "twilio/twilio"
      version = "0.9.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

# Credentials can be found at www.twilio.com/console.
provider "twilio" {
  //  username defaults to TWILIO_API_KEY with TWILIO_ACCOUNT_SID as the fallback env var
  //  password  defaults to TWILIO_API_SECRET with TWILIO_AUTH_TOKEN as the fallback env var
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "phone_system" {
  ami           = "ami-09d578a94c1a695ab" # 3CX Phone System AMI
  instance_type = "t2.micro"
  root_block_device {
    delete_on_termination = true
  }
}

resource "twilio_trunking_trunks_v1" "trunk" {
  friendly_name            = var.trunk_friendly_name
  disaster_recovery_method = "GET"
  disaster_recovery_url    = "https://www.twilio.com/docs/sip-trunking/api/trunk-resource"
  cnam_lookup_enabled      = false
  secure                   = false
  transfer_mode            = "enable-all"
  domain_name              = "${var.trunk_prefix}.pstn.twilio.com"
}

resource "twilio_trunking_trunks_origination_urls_v1" "origination_urls" {
  trunk_sid     = twilio_trunking_trunks_v1.trunk.sid
  enabled       = true
  friendly_name = "TrunkOriginationUrl"
  priority      = 1
  sip_url       = "sip:${aws_instance.phone_system.public_dns}"
  weight        = 1
}
