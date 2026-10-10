resource "aws_cloudformation_stack_instances" "cloudformation_stack_instances" {
  for_each = var.cloudformation_stack_instances

  stack_set_name      = each.value.stack_set_name
  accounts            = each.value.accounts
  call_as             = each.value.call_as
  parameter_overrides = each.value.parameter_overrides
  region              = each.value.region
  regions             = each.value.regions
  retain_stacks       = each.value.retain_stacks

  dynamic "deployment_targets" {
    for_each = each.value.deployment_targets != null ? [each.value.deployment_targets] : []
    content {
      account_filter_type     = deployment_targets.value.account_filter_type
      accounts                = deployment_targets.value.accounts
      accounts_url            = deployment_targets.value.accounts_url
      organizational_unit_ids = deployment_targets.value.organizational_unit_ids
    }
  }

  dynamic "operation_preferences" {
    for_each = each.value.operation_preferences != null ? [each.value.operation_preferences] : []
    content {
      concurrency_mode             = operation_preferences.value.concurrency_mode
      failure_tolerance_count      = operation_preferences.value.failure_tolerance_count
      failure_tolerance_percentage = operation_preferences.value.failure_tolerance_percentage
      max_concurrent_count         = operation_preferences.value.max_concurrent_count
      max_concurrent_percentage    = operation_preferences.value.max_concurrent_percentage
      region_concurrency_type      = operation_preferences.value.region_concurrency_type
      region_order                 = operation_preferences.value.region_order
    }
  }
}

