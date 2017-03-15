require "rubygems"
require "bunny"
require_relative "../workers/instagram_transformer"

class InstagramRabbitConnection

  def initialize(network)
    establish_connection
    @network = network
  end

  def establish_connection
    STDOUT.sync = true

    @conn = Bunny.new("amqp://guest:guest@localhost:5672")
    @conn.start

    @ch = @conn.create_channel
    @receive = @ch.queue( "instagram_payload", :auto_delete => false )
    @send = @ch.queue( "instagram_social_activity", :auto_delete => false )
    @exch = @ch.default_exchange
  end

  def get_message
    @payload = nil
    @receive.subscribe do |delivery_info, metadata, payload|
      tr = InstagramTransformer.new(payload)
      message = tr.transform
      publish_message message.inspect
    end

    @payload
  end

  def publish_message(payload)
    @exch.publish(payload, :routing_key => @send.name)
  end
end

class TestInstagramRabbitConnection < InstagramRabbitConnection
  def publish_mock_message
    t = TestPayload.new
    payload = t.test_input("instagram")
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
