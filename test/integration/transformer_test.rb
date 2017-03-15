require 'test_helper'
require_relative "../../app/subscribers/rabbitmq"

class TransformerTest < ActionDispatch::IntegrationTest
  test "transformation" do
    t = TestPayload.new
    r = RabbitConnection.new
    r.publish_mock_message
    r.get_message
    payload = nil
    while payload == nil
      payload = r.get_final
    end
    assert_equal(t.test_output, payload)
  end
end
