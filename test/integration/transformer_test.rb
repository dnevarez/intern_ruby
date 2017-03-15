require 'test_helper'
require_relative "test_payload"
require_relative "../../app/subscribers/rabbitmq"

class TransformerTest < ActionDispatch::IntegrationTest
  test "transformation" do
    t = TestPayload.new
    r = TestingRabbitConnection.new
    r.publish_mock_message
    r.get_message
    payload = nil
    while payload == nil
      payload = r.get_final
    end
    assert_equal(t.test_output, payload)
  end

  test "transformation_fields" do
    test_payload = TestPayload.new
    transformer = Transformer.new(test_payload.test_input.inspect)
    message = transformer.transform
    assert_equal "https://www.instagram.com/p/BGKKqSeoadh/", message[:activity_url]
    assert_equal "https://scontent.cdninstagram.com/t51.2885-19/12940036_1025946850808759_670550570_a.jpg", message[:author_picture_url]
    assert_equal "Sarah Flynt 👑", message[:author_real_name]
    assert_equal "himynameis_sarah", message[:author_username]
    assert_equal "743467152", message[:author_id]
    assert_equal "You make me so happy ♥\n#quote #edit #instapic #instagood #picoftheday #love #loml #doubletap #followforfollow #followback #happy #boyfriend #smile @someuser", message[:body_text]
    assert_equal "1263869531955242849_743467152", message[:id]
    assert_equal "instagram", message[:network]
    assert_equal "https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/13381140_104166473340754_1698310139_n.jpg?ig_cache_key=MTI2Mzg2OTUzMTk1NTI0Mjg0OQ%3D%3D.2.l", message[:post_media][:url]
    assert_equal "image", message[:post_media][:media_type]
  end

end

class TestingRabbitConnection < RabbitConnection
  def publish_mock_message
    t = TestPayload.new
    payload = t.test_input.inspect
    @exch.publish(payload, :routing_key => @receive.name)
  end

  def get_final()
    @payload = nil
    @send.subscribe do |delivery_info, metadata, payload|
      @payload = payload
    end
    @payload
  end
end