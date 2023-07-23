

# Create security group for web servers
resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow traffic from load balancer"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "HTTP from load balancer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
   
  }

  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  tags = {
    Name = "Allow HTTP from LB"
  }
}

# Create security group for Redis
resource "aws_security_group" "redis" {
  name        = "redis" 
  description = "Allow traffic from web servers"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "Redis from web servers"
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow Redis from web servers"
  }
}

# Create security group for MongoDB 
resource "aws_security_group" "mongo" {
  name        = "mongo"
  description = "Allow traffic from web servers"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "MongoDB from web servers"
    from_port       = 27017
    to_port         = 27017
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow MongoDb from web servers"
  }
}  

# Create security group for SQL Server
resource "aws_security_group" "sql" {
  name        = "sql"
  description = "Allow traffic from web servers"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "SQL Server from web servers"
    from_port       = 1433
    to_port         = 1433
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow SQL Server from web servers"
  } 
}
