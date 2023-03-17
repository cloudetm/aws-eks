data "aws_availability_zones" "available" {
    state = "available"
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "2.78.0"

    name = "test-vpc"
    cidr = "10.0.0.0/16"
    azs = slice(data.aws_availability_zones.available.names, 0, 2)

    public_subnets = [ "10.0.101.0/24", "10.0.102.0/24" ]

    private_subnets = [ "10.0.1.0/24", "10.0.2.0/24" ]
    enable_nat_gateway = true
    one_nat_gateway_per_az = false // This is should be `true` in production environments for high availability

    create_database_subnet_group = true
    create_database_subnet_route_table = true
    database_subnets = [ "10.0.151.0/24", "10.0.152.0/24" ]

    enable_dns_support = true
    enable_dns_hostnames = true
}