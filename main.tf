data "akamai_group" "my_group" {
    group_name = "ShChoudhary"
    contract_id = "ctr_1-1NC95D"
}

# output "my_group" {
#     value = data.akamai_group.my_group.id
# }

# data "akamai_appsec_configuration" "my_appsec_config" {
#     name = "shchoudh_waf_sc1"
# }

# output "my_appsec_config" {
#     value = data.akamai_appsec_configuration.my_appsec_config
# }

# data "akamai_property" "my_property" {
#     name = "test-amd2"
# }

# output "my_property" {
#     value = data.akamai_property.my_property
# }

# locals {
#     notes = "AKATEC-1101-${data.akamai_group.my_group.id}"
# }

# output "local-value" {
#     value = local.notes
# }



#For assignment 4.2 - loops

locals {
    app_hostnames = [for subdomain in var.apps: "${subdomain}.example.dom"]
}

output list-of-hostnames {
    value = local.app_hostnames
}