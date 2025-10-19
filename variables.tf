variable "edgerc_path" {
    description = "Edgerc path for provider.tf"
    type = string
    default = "~/.edgerc"
} 

variable "config_section" {
    description = "The section to use in edgerc file"
    type = string
    default = "terraform-sc"
}


#For assignment 4

variable "ab_test" {
    description = "test variable"
    type = string
    default = "A"
}