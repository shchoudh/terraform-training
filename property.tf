resource "akamai_cp_code" "sclubCPCODE" {
    name = "ScriptClubTerraformCPCode"
    product_id = "prd_Fresca"
    contract_id = data.akamai_group.my_group.contract_id
    group_id = tonumber(replace(data.akamai_group.my_group.id,"grp_",""))
}

resource "akamai_edge_hostname" "my_ehn" {
    contract_id = data.akamai_group.my_group.contract_id
    edge_hostname = "sclub.com.edgesuite.net"
    group_id = tonumber(replace(data.akamai_group.my_group.id,"grp_",""))
    product_id = "prd_Fresca"
    ip_behavior   = "IPV4"
    ttl           = 300
}

resource "akamai_property" "my_new_property" {
    contract_id = data.akamai_group.my_group.contract_id
    group_id = tonumber(replace(data.akamai_group.my_group.id,"grp_",""))
    name = "ScriptClubTerraform"
    product_id = "prd_Fresca" 

    #For assignment 4.3 - dynamic block

    dynamic "hostnames" {
      for_each = local.app_hostnames
      content {
        cname_from = hostnames.value
        cname_to = "www.example.com.edgesuite.net"
        cert_provisioning_type = "DEFAULT"
      }
    }
}


#for assignment 4
data "akamai_property_rules_builder" "my_default_rule" {
  rules_v2023_01_05 {
    name      = "default"
    behavior {
      origin {
        origin_type = "CUSTOMER"
        hostname = var.ab_test == "A" ? "origin-a.example.com" : "origin-b.example.com"
      }
    }
  }
}

#For assignment 4
output "origin_host"{
    value = data.akamai_property_rules_builder.my_default_rule.rules_v2023_01_05[0].behavior[0].origin[0].hostname
}