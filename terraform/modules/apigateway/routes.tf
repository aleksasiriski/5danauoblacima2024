resource "aws_apigatewayv2_route" "routes" {
  for_each = { for route in var.routes : "${route.method}-${route.pattern}" => route }

  api_id    = aws_apigatewayv2_api.gateway.id
  route_key = "${each.value.method} ${each.value.pattern}"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}
