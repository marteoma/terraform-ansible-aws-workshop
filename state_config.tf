terraform { 
    backend "s3" {
        # bucket          = "terraform.hachiko.app"
        bucket          = "terraform-ansible-aws-03"
        key             = "terraform-circleci-00/state"
        region          = "us-east-1"
        dynamodb_table  = "terraform-ansible-03"
        encrypt         = true
    }
}
