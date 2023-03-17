module "bastian_instance_security_group" {
    source = "terraform-aws-modules/security-group/aws"
    version = "4.7.0"

    name = "bastian-instance-security-group"
    description = "Security group for bastian instance with SSH port open to the internet"
    vpc_id = module.vpc.vpc_id

    ingress_rules = ["ssh-tcp"]
    ingress_cidr_blocks = ["0.0.0.0/0"]

    egress_rules = "all-all"

    depends_on = [
        module.vpc
    ]
}

data "aws_ami" "amazon_linux_2" {
    most_recent = true
    owners = [ "amazon" ]

    filter {
        name = "name"
        values = [ "amzn2-ami-hvm-*-gp2" ]
    }

    filter {
        name = "root-device-type"
        values = [ "ebs" ]
    }

    filter {
        name = "virtualization-type"
        values = [ "hvm" ]
    }

    filter {
        name = "architecture"
        values = [ "x86_64" ]
    }
}