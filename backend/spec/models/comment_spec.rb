# == Schema Information
#
# Table name: comments
#
#  id                                  :bigint           not null, primary key
#  content(コメントの内容)             :text(65535)      not null
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#  memo_id(コメントが参照するメモのID) :integer          not null
#
# Indexes
#
#  index_comments_on_memo_id  (memo_id)
#
RSpec.describe Comment, type: :model do
    subject(:comment) { build(:comment) }

    describe 'バリデーションのテスト' do
      context 'contentが有効な場合' do
        it 'valid?メソッドがtrueを返すこと' do
          expect(comment).to be_valid
        end
      end

      context 'contentが空文字の場合' do
        before { comment.content = " " }

        it 'valid?メソッドがfalseを返すこと' do
          expect(comment).to be_invalid
        end

        it 'errorsに「内容を入力してください」と格納されること' do
          comment.valid?
          expect(comment.errors.full_messages).to include('内容を入力してください')
        end
      end

      context 'contentがnilの場合' do
        before { comment.content = nil }

        it 'valid?メソッドがfalseを返すこと' do
          expect(comment).to be_invalid
        end

        it 'errorsに「内容を入力してください」と格納されること' do
          comment.valid?
          expect(comment.errors.full_messages).to include('内容を入力してください')
        end
      end
    end
  end
