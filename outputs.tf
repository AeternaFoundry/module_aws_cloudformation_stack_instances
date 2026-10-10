output "cloudformation_stack_instances_id" {
  description = "Map of id values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cloudformation_stack_instances_accounts" {
  description = "Map of accounts values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => v.accounts if v.accounts != null && length(v.accounts) > 0 }
}
output "cloudformation_stack_instances_call_as" {
  description = "Map of call_as values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => v.call_as if v.call_as != null && length(v.call_as) > 0 }
}
output "cloudformation_stack_instances_deployment_targets" {
  description = "Map of deployment_targets values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => one(v.deployment_targets) if v.deployment_targets != null && length(v.deployment_targets) > 0 }
}
output "cloudformation_stack_instances_operation_preferences" {
  description = "Map of operation_preferences values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => one(v.operation_preferences) if v.operation_preferences != null && length(v.operation_preferences) > 0 }
}
output "cloudformation_stack_instances_parameter_overrides" {
  description = "Map of parameter_overrides values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => v.parameter_overrides if v.parameter_overrides != null && length(v.parameter_overrides) > 0 }
}
output "cloudformation_stack_instances_region" {
  description = "Map of region values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => v.region if v.region != null && length(v.region) > 0 }
}
output "cloudformation_stack_instances_regions" {
  description = "Map of regions values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => v.regions if v.regions != null && length(v.regions) > 0 }
}
output "cloudformation_stack_instances_retain_stacks" {
  description = "Map of retain_stacks values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => v.retain_stacks if v.retain_stacks != null }
}
output "cloudformation_stack_instances_stack_instance_summaries" {
  description = "Map of stack_instance_summaries values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => v.stack_instance_summaries if v.stack_instance_summaries != null && length(v.stack_instance_summaries) > 0 }
}
output "cloudformation_stack_instances_stack_set_id" {
  description = "Map of stack_set_id values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => v.stack_set_id if v.stack_set_id != null && length(v.stack_set_id) > 0 }
}
output "cloudformation_stack_instances_stack_set_name" {
  description = "Map of stack_set_name values across all cloudformation_stack_instances, keyed the same as var.cloudformation_stack_instances"
  value       = { for k, v in aws_cloudformation_stack_instances.cloudformation_stack_instances : k => v.stack_set_name if v.stack_set_name != null && length(v.stack_set_name) > 0 }
}

