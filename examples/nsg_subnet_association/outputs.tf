// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

output "name" {
  value       = local.nsg_name
  description = "The nsg name."
}

output "vnet_subnets" {
  value       = module.network.vnet_subnets
  description = "The ids of subnets created inside the newly created virtual network."
}

output "vnet_names" {
  value       = module.network.vnet_names
  description = "The Names of the newly created virtual network."
}

output "resource_group_name" {
  value       = module.resource_group.name
  description = "The name of the resource group."
}

output "id" {
  value       = { for k, v in var.network_map : k => module.nsg_subnet_association[k].id }
  description = "The ID of the Subnet with the associated nsg."
}
