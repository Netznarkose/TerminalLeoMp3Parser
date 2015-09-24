require 'open-uri'
require 'nokogiri'

# url = "http://dict.leo.org/dictQuery/m-vocab/ende/query.xml?tolerMode=nof&lp=ende&lang=en&rmWords=off&rmSearch=on&directN=0&search=hello&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"
# noko = Nokogiri::XML(open(url))
# puts noko.class
def error_handling
    begin
url = "http://dict.leo.org/dictQuery/m-vocab/ende/query.xml?tolerMode=nof&lp=ende&lang=en&rmWords=off&rmSearch=on&directN=0&search=hello&searchLoc=0&resultOrder=basic&multiwordShowSingle=on&sectLenMax=16"
        url2 = "lsdjslkfjlsdkjflaa"
        noko2 = Nokogiri::XML(open(url))
        rescue 
            puts 'this is a name error'
        else
            puts 'everuthing is fine'
    end
end
error_handling

