"wazuh" = {
  name               = "wazuh"
  linux_sku          = "22_04-lts-gen2"
  linux_version      = "latest"
  ami                = "ami-0ef0fafba270833fc"
  private_ip_address = "{{ip_range}}.51"
  password           = "sgdvnkjhdshlsd"
  size               = "t2.large"  # 2cpu / 8GB
  instance_type      = "t2.large"  # 2cpu / 8GB
}
