variable "aws_region" {
  description = "AWS region"
  type        = string
  nullable    = false
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "AWS profile"
  type        = string
  nullable    = false
  default     = "982081080967_AWSAdministratorAccess"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  nullable    = false
  default     = "counter-strike"
}

variable "source_code_path" {
  description = "Path to the source code"
  type        = string
  nullable    = false
  default     = "../../../dist/index.mjs"
}

variable "routes" {
  description = "API Gateway routes (use {id} for path param named id (like how express uses :id))"
  type = list(object({
    pattern = string
    method  = string
  }))
  nullable = false
  default = [
    {
      pattern = "/players/create"
      method  = "POST"
    },
    {
      pattern = "/players/{id}"
      method  = "GET"
    },
    {
      pattern = "/players"
      method  = "GET"
    },
    {
      pattern = "/players"
      method  = "DELETE"
    },
    {
      pattern = "/players/{id}/leave_team"
      method  = "PUT"
    },
    {
      pattern = "/teams"
      method  = "POST"
    },
    {
      pattern = "/teams/{id}"
      method  = "GET"
    },
    {
      pattern = "/teams/generate_teams"
      method  = "POST"
    },
    {
      pattern = "/matches"
      method  = "POST"
    }
  ]
}
