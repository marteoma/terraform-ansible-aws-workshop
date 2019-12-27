/* Database Servers */

resource "aws_db_subnet_group" "us-east-1a-private" {
    name       = "db_private_subnet"
    subnet_ids = module.vpc.private_subnets # [aws_subnet.us-east-1a-private.id, aws_subnet.us-east-1b-private.id]

    tags = {
        Name        = "MySQL DB Subnet Group"
        Terraform   = "true"
        Environment = "dev"
    }
}

resource "aws_db_instance" "default" {
    allocated_storage       = 20
    storage_type            = "gp2"
    engine                  = "mysql"
    engine_version          = "5.7"
    instance_class          = "db.t2.micro"
    name                    = "clientsdb"
    username                = "admindb"
    password                = var.database_password
    parameter_group_name    = "default.mysql5.7"
    availability_zone       = module.vpc.azs[0]
    vpc_security_group_ids  = [module.db_sg.this_security_group_id]
    db_subnet_group_name    = aws_db_subnet_group.us-east-1a-private.name
    skip_final_snapshot     = "true"
}

# resource "null_resource" "setup_db" {
#   depends_on = ["aws_db_instance.default"]
#   provisioner "local-exec" {
#     command = "mysql -u ${aws_db_instance.default.username} -p${var.database_password} -h ${aws_db_instance.default.address} < file.sql"
#   }
# }