module "database" {
  source = "../../modules/dynamodb"

    name = "${var.project_name}-database"
}