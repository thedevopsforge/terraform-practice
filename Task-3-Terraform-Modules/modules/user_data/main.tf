data "template_file" "user_data" {
  template = file("${path.module}/script.sh")

  vars = {
    docker_image = var.docker_image
    container_port = var.container_port
  }
}

output "user_data" {
  value = data.template_file.user_data.rendered
}
