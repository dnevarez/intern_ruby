require 'test_helper'
require_relative "../../app/subscribers/twitter2_rabbitmq"

class Twitter2TransformerTest < ActionDispatch::IntegrationTest
  test "twitter2_transformation" do
    r = TestTwitter2RabbitConnection.new("twitter2")
    r.publish_mock_message
    r.get_message
    payload = nil
    while payload == nil
      payload = r.get_final
    end
    assert_equal(output("twitter2"), payload)
  end

  test "twitter2_transformation_fields" do
    test_payload = input "twitter2"
    transformer = Twitter2Transformer.new(test_payload)
    message = transformer.transform
    assert_equal "http://twitter.com/JenVento/statuses/794169597222064128", message[:activity_url]
    assert_equal "https://pbs.twimg.com/profile_images/378800000578979749/4ea77b8e30565b5bf1222b9042ae4e5f_normal.jpeg", message[:author_picture_url]
    assert_equal "Jennifer Vento", message[:author_real_name]
    assert_equal "JenVento", message[:author_username]
    assert_equal "id:twitter.com:18141787", message[:author_id]
    assert_equal "How women could vote Hillary Clinton into the White House https://t.co/jnFqk44nr4 #imwithher", message[:body_text]
    assert_equal "tag:search.twitter.com,2005:794169597222064128", message[:id]
    assert_equal "twitter", message[:network]
    assert_nil message[:post_media][:url]
    assert_nil message[:post_media][:media_type]
  end
end
