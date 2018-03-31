require 'json'
require 'csv'
require 'open-uri'

class KaomojitokaToGoogleImeDictionary
  KAOMOJITOKA_URI     = 'http://kaomoji.n-at.me/kaomoji.json'.freeze
  DICTIONARY_YOMIKATA = 'かおもじとか'.freeze
  DICTIONARY_HINSHI   = '顔文字'.freeze
  DICTIONARY_COMMENT  = ''.freeze
  OUTPUT_FILENAME     = 'kaomojitoka_to_google_ime_dictionary.txt'.freeze

  def initialize
    kaomojitoka_json    = open(KAOMOJITOKA_URI, &:read)
    @kaomojitoka_array  = JSON.parse(kaomojitoka_json)
  end

  def create_csv
    CSV.open(OUTPUT_FILENAME, 'w', force_quotes: true) do |csv_file|
      @kaomojitoka_array['records'].each do |record|
        csv_file << [DICTIONARY_YOMIKATA, "#{record['text']}", DICTIONARY_HINSHI, DICTIONARY_COMMENT]
      end
    end
  end
end

obj = KaomojitokaToGoogleImeDictionary.new
obj.create_csv
