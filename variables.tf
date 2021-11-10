variable "trunk_prefix" {
  # Environment variable `TF_VAR_trunk_prefix` must be defined.
  type        = string
  description = "Sub-domain that completes fqdn of Twilio Elastic SIP trunk."
}
