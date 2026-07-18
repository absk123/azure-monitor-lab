module "resource_group" {

  source = "../../modules/resource_group"

  resource_group_name = var.resource_group_name

  location = var.location

  tags = local.tags

}

module "network" {
  source = "../../modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  vnet_name = "vnet-monitor-lab"

  address_space = ["10.0.0.0/16"]

  web_subnet_prefix        = "10.0.1.0/24"
  app_subnet_prefix        = "10.0.2.0/24"
  management_subnet_prefix = "10.0.3.0/24"

  tags = local.tags
}