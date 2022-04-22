variable "trunk_prefix" {
  # Environment variable `TF_VAR_trunk_prefix` must be defined.
  type        = string
  description = "Sub-domain that completes fqdn of Twilio Elastic SIP trunk."
}

variable "trunk_friendly_name" {
  type        = string
  description = "Friendly name for Twilio Elastic SIP trunk."
  default     = "ajpbxny1"
}
