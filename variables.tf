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