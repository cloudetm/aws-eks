module "bastian_instance_security_group" {
    source = "terraform-aws-modules/security-group/aws"
    version = "4.7.0"

    name = "bastian-instance"
    description = "Security group for bastian instance with SSH port open to the internet"
    vpc_id = module.vpc.vpc_id

    ingress_rules = ["ssh-tcp"]
    ingress_cidr_blocks = ["0.0.0.0/0"]

    egress_rules = "all-all"

    depends_on = [
        module.vpc
    ]
}