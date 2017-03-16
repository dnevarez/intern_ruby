require "test_helper"
require_relative "../../app/subscribers/twitter1_rabbitmq"

class Twitter1TransformerTest < ActionDispatch::IntegrationTest
  test "twitter1_transformation" do
    r = TestTwitter1RabbitConnection.new("twitter1")
    r.publish_mock_message
    r.get_message
    payload = nil
    while payload == nil
      payload = r.get_final
    end
    assert_equal(output("twitter1"), payload)
  end

  test "twitter1_transformation_fields" do
    test_payload = input "twitter1"
    transformer = Twitter1Transformer.new(test_payload)
    message = transformer.transform
    assert_equal "http://twitter.com/MckeonLutz/statuses/751152691611463680", message[:activity_url]
    assert_equal "https://abs.twimg.com/sticky/default_profile_images/default_profile_0_normal.png", message[:author_picture_url]
    assert_equal "MckeonLutz", message[:author_real_name]
    assert_equal "MckeonLutz", message[:author_username]
    assert_equal "id:twitter.com:1386906962", message[:author_id]
    assert_equal "RT @StylishRentals: Love this! \"Modern style Country Villa - Houses for Rent in Almoster\" @airbnb #Travelhttps://t.co/xJ479oYcx9", message[:body_text]
    assert_equal "tag:search.twitter.com,2005:751152691611463680", message[:id]
    assert_equal "twitter", message[:network]
    assert_nil message[:post_media][:url]
    assert_nil message[:post_media][:media_type]
  end
end
