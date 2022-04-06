resource "aws_instance" "server" {
  ami           = "ami-0c35b19f123ef9f71"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.net_server.id
    device_index         = 0
  }

}
resource "aws_instance" "agent" {
  ami           = "ami-090fa307fb3139b24"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.net_client.id
    device_index         = 0
  }

}

