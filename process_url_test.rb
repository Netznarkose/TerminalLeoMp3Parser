require 'minitest/autorun'
require './process_url'

class TestSearchWord < Minitest::Test

  def setup
    @search_word = SearchWord.new
  end


  

  describe SearchWord do
    before do
      @search_word = SearchWord.new
    end

    describe "#prompting_language_display" do
      it "it returns english as the default langugae" do
        @search_word.prompting_language_display.must_equal "\nLanguage is set to: English"
      end
    end
  end
  
  describe SearchWord do
    before do
      @search_word = SearchWord.new
      @search_word.sprache = 'f'
    end

    describe "#prompting_language_display" do
      it "it returns french when user typed f" do
        @search_word.prompting_language_display.must_equal "\nLanguage is set to: French"
      end
    end
  end
    # ein synonym
    # def test_language_default_message
    #   assert_equal 'Language is set to: ', @mp3.language
    # end

  # describe "raises an error" do
  #   it "does something" do
  #     Ooops
  #   end
  # end
end
  

