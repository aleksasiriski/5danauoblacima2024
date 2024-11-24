output "api_endpoint" {
  // AWS should really provide this as an output
  value = "${aws_apigatewayv2_api.gateway.id}.execute-api.${data.aws_region.current.name}.amazonaws.com"
}
