locals { 
    lambda_title_text_name  = "YuGiOhBot__Title_and_Text"
}

variable "region" {
  description = "The AWS region to deploy in."
  default = "eu-west-2"
}

variable "s3_package" {
  description = "The name of the package to deploy in S3."
  default = "yugiohbot-title-text-package.zip"
}

variable "local_package" {
  description = "The location of the package to deploy."
  default = "../package.zip"
}

variable "bucket" {
  description = "The S3 bucket where the package is stored."
  default = "021651181835-lambda-packages"
}

variable "nltk_location" {
  description = "The location of the nltk_data folder within the Lambda."
  default = "/var/task/nltk_data"
}

variable "handler" {
  description = "Name of the lambda function and handler entrypoint."
  default = "lambda_function.lambda_handler"
}

variable "runtime" {
  description = "The runtime language to be used."
  default = "python3.7"
}