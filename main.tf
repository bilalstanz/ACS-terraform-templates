
terraform {
  required_providers {
    cloudstack = {
      source = "cloudstack/cloudstack"
      version = "0.4.0"
    }
  }
}

provider "cloudstack" {
  # Configuration options
#   api_url    = "${var.cloudstack_api_url}"
#   api_key    = "${var.cloudstack_api_key}"
#   secret_key = "${var.cloudstack_secret_key}"
  api_url    = "http://172.31.7.6:8080/client/api"
  api_key    = "<api-key>"
  secret_key = "<secret-key>"
}


# data "cloudstack_template" "my_template" {
#   template_filter = "community"

#   filter {
#     name = "name"
#     value = "UBUNTU"
#   }

#   filter {
#     name = "hypervisor"
#     value = "KVM"
#   }
# }



resource "cloudstack_instance" "web" {
  name             = "server-4t"
  service_offering = "IN_NOI_1C_1R"
  network_id       = "39f3cc86-08b9-4745-97c7-4f6248847f0e"
  # template         = "148aa306-5652-41a4-8d5b-5603964dc4b4"
  template         = "IN_NOI_LIN_20GB_UBUNTU_18"
  zone             = "IQ_NOI_KVM_VPC"
  keypair          = "redis-test"
  root_disk_size   = "20"
}



