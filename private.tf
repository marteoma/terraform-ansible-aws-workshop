/* Database Servers */

resource "aws_db_subnet_group" "us-east-1a-private" {
    name       = "db_private_subnet"
    subnet_ids = [aws_subnet.us-east-1a-private.id, aws_subnet.us-east-1b-private.id]

    tags = {
        Name = "MySQL DB Subnet Group"
    }
}

# resource "aws_db_instance" "default" {
#     allocated_storage       = 20
#     storage_type            = "gp2"
#     engine                  = "mysql"
#     engine_version          = "5.7"
#     instance_class          = "db.t2.micro"
#     name                    = "clientsdb"
#     username                = "admindb"
#     password                = "a1s2d3f4"
#     parameter_group_name    = "default.mysql5.7"
#     availability_zone       = var.availability_zone
#     vpc_security_group_ids  = [aws_security_group.db.id]
#     db_subnet_group_name    = aws_db_subnet_group.us-east-1a-private.name
#     skip_final_snapshot     = "true"
# }