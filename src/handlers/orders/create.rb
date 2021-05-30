# frozen_string_literal: true

require 'json'
require 'date'
require 'securerandom'
require 'aws-sdk-dynamodb'

def create(event:, context:)
  body = JSON.parse(event["body"])
  name = body["name"]
  date = DateTime.now.iso8601

  order = {
    id: SecureRandom.uuid,
    name: name,
    status: 'INCOMING_ORDER',
    created_at: date
  }

  dynamodb_client.put_item(table_item(order))

  { statusCode: 201, body: order.to_json }
end

def table_item(item)
  {
    table_name: 'OrdersTable',
    item: item
  }
end

def dynamodb_client
  Aws::DynamoDB::Client.new
end
