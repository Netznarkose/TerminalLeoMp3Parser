module Operations
  def prompt_user
    print "\nword =>  "; gets.chomp!
  end

  def clear
    puts `clear`
  end

  def instantiate_leo_mp3_parser
    LeoMp3Parser.new
  end

  def instantiate_vocab
    Vocab.new
  end

  def leo_mp3_dictionary # better naming
    {
      'e'    => 'ende',
      's'    => 'esde',
      'f'    => 'frde'
    }
  end

  def translate_params(language_and_term) # better naming
    { language: leo_mp3_dictionary[language_and_term[:language]], term: language_and_term[:term] }
  end

  def copy_to_clipboard(content)
    Clipboard.copy(content)
  end
end
