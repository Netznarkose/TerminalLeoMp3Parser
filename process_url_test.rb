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
    describe "#prompting_language_display" do
      it "it returns French when user typed f" do
        @search_word.sprache = 'f'
        @search_word.prompting_language_display.must_equal "\nLanguage is set to: French"
      end
  end

    describe "#generate_nokogiri_object" do
      it "it returns a valid nokogiri class instance" do
        skip("reason for skipping the test")
        @search_word.sprache = 'e'
        @search_word.begriff = 'dog'
        @search_word.generate_nokogiri_object.must_equal Nokogiri::XML::Document
      end
    end
    
    describe "#flash_message" do
      it "it returns the right message" do
        @search_word.flash_message(:success).must_equal '\nMp3 was copied to the Clipboard'
      end
    end
    
    describe "generate_nokogiri_object" do
      it "it is testing the exception the happy path" do
        @search_word.url = "http://dict.leo.org/dictQuery/m-vocab/ende/query.xml?tolerMode=nof&lp=ende&lang=en&rmWords=off&rmSearch=on&directN=0&search=hello&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"
        @search_word.generate_nokogiri_object.must_equal '\nMp3 was copied to the Clipboard'
      end
    end
    describe "generate_nokogiri_object" do
      it "it is testing the exception the bad path" do
        @search_word.url = "somerandomstuff23945087"
        @search_word.generate_nokogiri_object.must_equal 'could not be found'
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
  

