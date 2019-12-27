variable "aws_region" {
    description     = "EC2 Region for the VPC"
    default         = "us-east-1"
}

variable "availability_zone" {
    description     = "Availability Zone for resources"
    default         = "us-east-1a"
}

variable "availability_zone_b" {
    description     = "Availability Zone for resources"
    default         = "us-east-1b"
}

variable "aws_amis" {
    description     = "AMIs by Region"
    default = {
        #us-east-1 = "ami-04b9e92b5572fa0d1" # Ubuntu-bionic-18.04-amd64
        us-east-1 = "ami-00068cd7555f543d5" # ami-00068cd7555f543d5 Amazon Linux 2 AMI
    }
}

variable "machine_type" {
    description     = "Cloud Machine Type"
    default         = "t2.micro"
}

variable "number_of_instances" {
    description     = "Number of instances"
    default         = 2
}

variable "key_name" {
    description     = "AWS Key Name"
    default         = "awslabs"
}

variable "ssh_private_key" {
    description     = "Private Key for Terraform-Ansible Project"
    default         = "awslabs.pem"
}

variable "ssh_public_key" {
    description     = "Public Key for Terraform-Ansible Project"
    default         = "ansible_aws.pub"
}

variable "vpc_cidr" {
    description     = "CIDR for the whole VPC"
    default         = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
    description     = "CIDR for the Public Subnet"
    default         = "10.20.3.0/24"
}

variable "private_subnet_cidr" {
    description     = "CIDR for the Private Subnet"
    default         = "10.20.7.0/24"
}

variable "private_subnet_cidr_b" {
    description     = "CIDR for the Private Subnet B"
    default         = "10.20.8.0/24"
}

variable "database_password" {
    description     = "Database password."
    default         = "a1s2d3f4"
}