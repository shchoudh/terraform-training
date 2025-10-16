data "akamai_group" "my_group1" {
    group_name = "ShChoudhary"
    contract_id = "ctr_1-1NC95D"
}

output "my_group1" {
    value = data.akamai_group.my_group1.id
}

data "akamai_appsec_configuration" "my_appsec_config1" {
    name = "shchoudh_waf_sc1"
}

output "my_appsec_config1" {
    value = data.akamai_appsec_configuration.my_appsec_config1.id
}

data "akamai_property" "my_property1" {
    name = "test-amd2"
}

output "my_property1" {
    value = data.akamai_property.my_property1.product_id
}