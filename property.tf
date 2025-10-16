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
}
