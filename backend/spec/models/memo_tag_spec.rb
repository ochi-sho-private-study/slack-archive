# frozen_string_literal: true

RSpec.describe MemoTag do
  describe 'バリデーションのテスト' do
    let!(:memo_tag) { build(:memo_tag) }

    context '属性が正常な場合' do
      it 'trueを返す' do
        expect(memo_tag).to be_valid
      end
    end

    context 'memo_idとtag_idが重複している場合' do
      let(:already_exist_model) { create(:memo_tag) }
      let(:model) do
        build(
          :memo_tag,
          memo: already_exist_model.memo,
          tag: already_exist_model.tag
        )
      end

      it 'falseになり、errorsが格納される' do
        aggregate_failures do
          expect(model).not_to be_valid
          expect(model.errors.full_messages).to eq ['メモはすでに存在します']
        end
      end
    end
  end
end
