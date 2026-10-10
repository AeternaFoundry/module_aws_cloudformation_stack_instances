variable "cloudformation_stack_instances" {
  description = <<EOT
Map of cloudformation_stack_instances, attributes below
Required:
    - stack_set_name
Optional:
    - accounts
    - call_as
    - parameter_overrides
    - region
    - regions
    - retain_stacks
    - deployment_targets (block):
        - account_filter_type (optional)
        - accounts (optional)
        - accounts_url (optional)
        - organizational_unit_ids (optional)
    - operation_preferences (block):
        - concurrency_mode (optional)
        - failure_tolerance_count (optional)
        - failure_tolerance_percentage (optional)
        - max_concurrent_count (optional)
        - max_concurrent_percentage (optional)
        - region_concurrency_type (optional)
        - region_order (optional)
EOT

  type = map(object({
    stack_set_name      = string
    accounts            = optional(set(string))
    call_as             = optional(string)
    parameter_overrides = optional(map(string))
    region              = optional(string)
    regions             = optional(set(string))
    retain_stacks       = optional(bool)
    deployment_targets = optional(object({
      account_filter_type     = optional(string)
      accounts                = optional(set(string))
      accounts_url            = optional(string)
      organizational_unit_ids = optional(set(string))
    }))
    operation_preferences = optional(object({
      concurrency_mode             = optional(string)
      failure_tolerance_count      = optional(number)
      failure_tolerance_percentage = optional(number)
      max_concurrent_count         = optional(number)
      max_concurrent_percentage    = optional(number)
      region_concurrency_type      = optional(string)
      region_order                 = optional(list(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cloudformation_stack_instances : (
        v.deployment_targets == null || (v.deployment_targets.accounts_url == null || (can(regex("(s3://|http(s?)://).+", v.deployment_targets.accounts_url))))
      )
    ])
    error_message = ""
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudformation_stack_instances : (
        v.deployment_targets == null || (v.deployment_targets.organizational_unit_ids == null || (alltrue([for x in v.deployment_targets.organizational_unit_ids : can(regex("^(ou-[0-9a-z]{4,32}-[0-9a-z]{8,32}|r-[0-9a-z]{4,32})$", x))])))
      )
    ])
    error_message = ""
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudformation_stack_instances : (
        v.operation_preferences == null || (v.operation_preferences.failure_tolerance_count == null || (v.operation_preferences.failure_tolerance_count >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudformation_stack_instances : (
        v.operation_preferences == null || (v.operation_preferences.failure_tolerance_percentage == null || (v.operation_preferences.failure_tolerance_percentage >= 0 && v.operation_preferences.failure_tolerance_percentage <= 100))
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudformation_stack_instances : (
        v.operation_preferences == null || (v.operation_preferences.max_concurrent_count == null || (v.operation_preferences.max_concurrent_count >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudformation_stack_instances : (
        v.operation_preferences == null || (v.operation_preferences.max_concurrent_percentage == null || (v.operation_preferences.max_concurrent_percentage >= 1 && v.operation_preferences.max_concurrent_percentage <= 100))
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudformation_stack_instances : (
        v.operation_preferences == null || (v.operation_preferences.region_order == null || (alltrue([for x in v.operation_preferences.region_order : can(regex("^[0-9A-Za-z-]{1,128}$", x))])))
      )
    ])
    error_message = ""
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

