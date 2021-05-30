# frozen_string_literal: true

require 'json'
require 'aws-sdk-dynamodb'

def get(event:, context:)
  result = dynamodb_client.scan(scan_condition)
  puts result
  orders = result.items

  { statusCode: 200, body: orders.to_json }
end

def scan_condition
  {
    table_name: 'OrdersTable'
  }
end

def dynamodb_client
  Aws::DynamoDB::Client.new
end
