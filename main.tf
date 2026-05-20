resource "aws_instance" "docker" {
    ami = local.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all_docker.id]
    user_data = file("docker.sh")

    tags = merge(
        local.common_tags,
        {
            Name = "docker"
        }
    )
}

resource "aws_security_group" "allow_all_docker" {
  name        = "allow_all_docker"
  description = "Allow all traffic"

    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
