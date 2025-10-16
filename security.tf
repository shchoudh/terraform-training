
data "akamai_appsec_configuration" "my_appsec_config2" {
    name = "shchoudh_waf_sc1"
}


resource "akamai_appsec_configuration" "my_sec_config" {
    name = "shchoudh_waf_sclub"
    description = "Appsec config created for Script club HW using Terraform"
    contract_id = "1-1NC95D"
    host_names = ["www.test-dsa-ssc.com"]
    group_id = tonumber(replace(data.akamai_group.my_group.id,"grp_",""))
}

resource "akamai_appsec_security_policy" "my_policy" {
security_policy_name = "scrip_club1"
security_policy_prefix = "waf2"
config_id = akamai_appsec_configuration.my_sec_config.config_id
}