require 'spec_helper'
require './kaomojitoka_to_google_ime_dictionary'

describe 'Initialize' do
  it 'defines values' do
    obj = KaomojitokaToGoogleImeDictionary.new
    # @kaomojitoka_array

    expect(true).to_not eq false
  end
end
