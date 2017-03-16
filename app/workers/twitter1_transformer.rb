require "date"

class Twitter1Transformer

  def initialize(payload)
    @payload = eval(payload)
  end

  def transform
    @message = {
      :activity_url => @payload.dig(:link),
      :author_picture_url => @payload.dig(:actor, :image),
      :author_real_name => @payload.dig(:actor, :displayName),
      :author_username => @payload.dig(:actor, :preferredUsername),
      :author_id => @payload.dig(:actor, :id),
      :body_text => @payload.dig(:body),
      :id => @payload.dig(:id),
      :network => "twitter",
      :post_media => generate_media,
    }
  end

  def generate_media
    media = {
        :url => @payload.dig(:images, :standard_resolution, :url),
        :media_type => @payload.dig(:type),
    }
  end
end
