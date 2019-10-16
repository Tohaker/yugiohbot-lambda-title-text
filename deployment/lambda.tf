resource "aws_lambda_function" "title_text" {
  filename          = var.package
  source_code_hash  = filebase64sha256(var.package)
  handler           = var.handler

  function_name     = local.lambda_title_text_name
  role              = aws_iam_role.lambda_title_text.arn
  
  runtime           = var.runtime
  timeout           = 60

  environment {
    variables = {
      NLTK_DATA = var.nltk_location
    }
  }
}

resource "aws_cloudwatch_log_group" "title_text" {
  name = "/aws/lambda/${local.lambda_title_text_name}"
}

resource "aws_cloudwatch_event_rule" "every_hour" {
  name                = "every-hour"
  description         = "Triggers every hour"
  schedule_expression = "cron(0 * * * *)"
}

resource "aws_cloudwatch_event_target" "every_hour" {
  rule      = aws_cloudwatch_event_rule.every_hour.name
  target_id = "create_new_card"
  arn       = aws_lambda_function.title_text.arn
}

resource "aws_lambda_permission" "allow_execution_from_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.title_text.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.every_hour.arn
}
