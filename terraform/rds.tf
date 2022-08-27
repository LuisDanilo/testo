# resource "aws_db_instance" "motivy_db" {
#   name                        = var.rds_db_name
#   identifier                  = "motivy-postgress"
#   username                    = var.rds_username
#   password                    = var.rds_password
#   port                        = "5432"
#   engine                      = "postgres"
#   engine_version              = "10.5"
#   instance_class              = var.rds_instance
#   allocated_storage           = "10"
#   storage_encrypted           = false
#   vpc_security_group_ids      = [aws_security_group.motivy_rds_sg.id]
#   db_subnet_group_name        = aws_db_subnet_group.motivy_subnet_group.name
#   parameter_group_name        = "default.postgres10"
#   multi_az                    = false
#   storage_type                = "gp2"
#   publicly_accessible         = true
#   allow_major_version_upgrade = false
#   auto_minor_version_upgrade  = false
#   apply_immediately           = true
#   maintenance_window          = "sun:02:00-sun:04:00"
#   skip_final_snapshot         = false
#   copy_tags_to_snapshot       = true
#   backup_retention_period     = 7
#   backup_window               = "04:00-06:00"
#   final_snapshot_identifier   = "motivy-postgress"
# }