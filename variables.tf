
variable "name_prefix" {
  description = "(Optional) - Name prefix for project"
  type        = string
  default     = "project"
}

variable "folder_id" {
  description = "(Optional) - YC Folder ID where resources will be created"
  type        = string
}

variable "zones" {
  description = "(Optional) - YC Cloud Zones for provisoned resources."
  type        = set(string)
  default     = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
}

variable "image_id" {
  description = "(Optional) - Boot disk image id. If not provided, it defaults to Ubuntu 22.04 LTS image id"
  type        = string
  default     = "fd8ba9d5mfvlncknt2kd"
}

variable "instance_resources" {
  description = <<EOF
    (Optional) Specifies the resources allocated to an instance.
      - `platform_id`: The type of virtual machine to create.If not provided, it defaults to `standard-v3`.
      - `cores`: The number of CPU cores allocated to the instance.
      - `memory`: The amount of memory (in GiB) allocated to the instance.
      - `disk`: Configuration for the instance disk.
        - `disk_type`: The type of disk for the instance. If not provided, it defaults to `network-ssd`.
        - `disk_size`: The size of the disk (in GiB) allocated to the instance. If not provided, it defaults to 15 GiB.
  EOF

  type = object({
    platform_id = optional(string, "standard-v3")
    cores       = number
    memory      = number
    disk = optional(object({
      disk_type = optional(string, "network-ssd")
      disk_size = optional(number, 15)
    }), {})
  })
}

variable "subnets" {
  description = "(Optional) - A map of subnet names to their CIDR block ranges"
  type        = map(list(string))
  default = {
    "ru-central1-a" = ["192.168.10.0/24"]
    "ru-central1-b" = ["192.168.11.0/24"]
    "ru-central1-c" = ["192.168.12.0/24"]
  }
}

variable "boot_disk_name" {
  description = "(Optional) - Name of boot disk"
  type        = string
  default     = null
}

variable "linux_vm_name" {
  description = "Name of the linux VM"
  type        = string
  default     = null
}

variable "vpc_network_name" {
  description = "(Optional) - Name of the VPC network"
  type        = string
  default     = null
}

variable "ydb_serverless_name" {
  description = "(Optional) - Name of the YDB serverless."
  type        = string
  default     = null
}

variable "bucket_sa_name" {
  description = "(Optional) - Name of the service account for the bucket"
  type        = string
  default     = null
}

variable "bucket_name" {
  description = "(Optional) - Name of the bucket"
  type        = string
  default     = null
}