require 'spec_helper'
require './kaomojitoka_to_google_ime_dictionary'

describe '#initialize' do
  before do
    # 実際にアクセスが発生しているのでとても良くない
    obj = KaomojitokaToGoogleImeDictionary.new
    @kaomojitoka_hash = obj.kaomojitoka_hash
  end

  it '@kaomojitoka_hash がハッシュで定義されること' do
    expect(@kaomojitoka_hash.class).to eq Hash
  end
end

describe '#create_csv' do
  before do
    # 実際にアクセスが発生しているのでとても良くない
    obj = KaomojitokaToGoogleImeDictionary.new
    @kaomojitoka_hash = obj.kaomojitoka_hash

    @csv_file_data = []
    @kaomojitoka_hash['records'].each do |record|
      @csv_file_data << ['DICTIONARY_YOMIKATA', (record['text']).to_s, 'DICTIONARY_HINSHI', 'DICTIONARY_COMMENT']
    end
  end

  it 'CSVファイルに書き込む「行」の集合は配列で表現されること' do
    expect(@csv_file_data.class).to eq Array
  end

  it 'CSVファイルに書き込まれる行数は API の戻り値の要素数と同一であること' do
    expect(@kaomojitoka_hash['records'].count).to eq @csv_file_data.count
  end
end
