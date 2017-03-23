require 'spec_helper'
require_relative '../lib/operations.rb'
RSpec.describe 'operations' do
  let(:operations) { (Class.new { include Operations }).new }
  let(:arguments_app_syntax) { { language: 'e', term: 'hello' } }
  let(:arguments_gem_syntax) { { language: 'ende', term: 'hello' } }

  describe '#leo_mp3_parser_argument_adapter' do

    it 'converts arguments to fit the need of leo_mp3_parser' do
      expect(operations.leo_mp3_parser_argument_adapter(arguments_app_syntax)).to eq(arguments_gem_syntax)
    end
  end
end
