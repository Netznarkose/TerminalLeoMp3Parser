require_relative '../lib/nav_bar.rb'
RSpec.describe 'nav_bar' do
  let(:nav_bar) { (Class.new { include NavBar }).new }

  describe '#header' do
    it 'outputs the correct header' do
      expect { nav_bar.header }.to output(correct_header).to_stdout
    end
  end
  describe '#looked_up_vocab' do
    it 'prints the correct message when empty' do
      expect(nav_bar.looked_up_vocab([])).to eq("\nLooked up Vocabulary: No Activity yet")
    end
    it 'prints the correct vocab-list' do
      expect(nav_bar.looked_up_vocab(['house', 'mouse'])).to eq("\nLooked up Vocabulary: [\"house\", \"mouse\"]")
    end
  end
end
def correct_header
  puts(<<-EOT)
    '#########        L E O -- M P 3 -- P A R S E R        #########

     Type:  exit => Exit   e => English   s => Spanish   f => French'
  EOT
end
