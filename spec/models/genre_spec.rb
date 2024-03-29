require 'rails_helper'

RSpec.describe 'Genreモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { genre.valid? }

    let(:genre) { build(:genre) }

    context 'genre_nameカラム' do
      it '空欄でないこと' do
        genre.genre_name = ''
        is_expected.to eq false
      end
    end
  end
end
