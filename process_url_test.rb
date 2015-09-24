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
    
      describe "#prompting_register" do
      it "display the register when there was no activity yet" do
        @search_word.prompting_register.must_equal "\nLooked up Vocabulary: no Activity yet"
      end
    end
      describe "#prompting_register" do
      it "puts words into register after search" do
        @search_word.sprache = 'e'
        @search_word.begriff = 'house'
        @search_word.get_mp3
        @search_word.prompting_register.must_equal "Looked up Vocabulary: ['house']"
      end
    end

    describe "#get_mp3" do
      it "it returns a valid nokogiri class instance" do
        skip("hausaufgabe")
        # alle user input eingabe formen
        # die exceptions
      end
    end
    
    describe "#flash_message" do
      it "it returns the right success-message" do
        skip
        @search_word.flash_message(:success).must_equal '\nMp3 was copied to the Clipboard'
      end
    end
    
    describe "#flash_message" do
      it "it returns the right danger-message" do
        skip
        @search_word.flash_message(:danger).must_equal 'could not be found'
      end
    end
    
  end
  
end
  

