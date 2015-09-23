require 'minitest/autorun'
require './mp3'

class TestMp3 < Minitest::Test

  def setup
    @mp3 = Mp3.new
  end

  def test_default_settings
    skip('there is no need to test this')
  end

  def test_empty_array
    assert_equal [], @mp3.default_settings
  end
  

  describe Mp3 do
    before do
      @mp3 = Mp3.new
      @mp3.default_settings
    end

    describe "#language" do
      it "it returns english as the default langugae" do
        @mp3.language.must_equal "Language is set to: English"
      end
    end
    # ein synonym
    # def test_language_default_message
    #   assert_equal 'Language is set to: ', @mp3.language
    # end
  end

  # describe "raises an error" do
  #   it "does something" do
  #     Ooops
  #   end
  # end
end
  

