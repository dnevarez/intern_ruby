require "date"

class InstagramTransformer

  def initialize(payload)
    @payload = eval(payload)
  end

  def transform
    @message = {
        :activity_url => @payload.dig(:link),
        :author_picture_url => @payload.dig(:user, :profile_picture),
        :author_real_name => @payload.dig(:user, :full_name),
        :author_username => @payload.dig(:user, :username),
        :author_id => @payload.dig(:user, :id),
        :body_text => @payload.dig(:caption, :text),
        :id => @payload.dig(:id),
        :network => "instagram",
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