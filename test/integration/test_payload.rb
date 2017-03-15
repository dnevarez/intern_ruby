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

  def test_output(network)
    message = ""
    File.open "test/fixtures/files/#{network}_social_activity.json", "r" do |f|
      f.each_line do |line|
        message += line
      end
    end
    message
  end
  end
