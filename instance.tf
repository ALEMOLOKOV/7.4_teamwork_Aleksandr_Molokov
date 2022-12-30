module "instance" {
  source = "./terraform-modules/modules/instance"
  

  subnet_id     = "default"
  zone = var.yc_region
  folder_id = module.vpc.folder_id
  image         = "centos-7"
  platform_id   = "standard-v2"
  name          = "test"
  users         = "centos"
  cores         = "2"
  boot_disk     = "network-ssd"
  disk_size     = 20
  nat           = "true"
  memory        = "2"
}

variable "memory" {}
output "config" {
 value = "${var.memory}"
}


output "instance_parametrs" {
  value = {
    ${module.instance.config}
  }
}


