# frozen_string_literal: true

require 'json'
require 'date'

def create(event:, context:)
  body = JSON.parse(event["body"])
  name = body["name"]
  date = DateTime.now.iso8601

  order = {
    name: name,
    status: 'INCOMING_ORDER',
    created_at: date
  }

  { statusCode: 201, body: order.to_json }
end
