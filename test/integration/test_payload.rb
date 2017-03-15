class TestPayload
  def test_input(network)
    message = ""
    File.open "test/fixtures/files/#{network}_payload.json", "r" do |f|
     f.each_line do |line|
       message += line
     end
    end
    message
  end

  def test_output
    message = "{:activity_url=\u003e\"https://www.instagram.com/p/BGKKqSeoadh/\", :author_picture_url=\u003e\"https://scontent.cdninstagram.com/t51.2885-19/12940036_1025946850808759_670550570_a.jpg\", :author_real_name=\u003e\"Sarah Flynt \\xF0\\x9F\\x91\\x91\", :author_username=\u003e\"himynameis_sarah\", :author_id=\u003e\"743467152\", :body_text=\u003e\"You make me so happy \\xE2\\x99\\xA5\\n#quote #edit #instapic #instagood #picoftheday #love #loml #doubletap #followforfollow #followback #happy #boyfriend #smile @someuser\", :id=\u003e\"1263869531955242849_743467152\", :network=\u003e\"instagram\", :post_media=\u003e{:url=\u003e\"https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/13381140_104166473340754_1698310139_n.jpg?ig_cache_key=MTI2Mzg2OTUzMTk1NTI0Mjg0OQ%3D%3D.2.l\", :media_type=\u003e\"image\"}}"

  end
end