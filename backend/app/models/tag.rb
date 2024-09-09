# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id               :bigint           not null, primary key
#  color(色)        :string(255)
#  label(ラベル)    :string(255)      not null
#  priority(優先度) :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  unique_index_label_on_tags  (label) UNIQUE
#
class Tag < ApplicationRecord
  has_many :memo_tags, dependent: :destroy
  has_many :memos, through: :memo_tags

  validates :label, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :priority, presence: true
  validates :color, presence: true

  enum color: { white: 0, black: 10, red: 20, orange: 30, yellow: 40, green: 50, blue: 60, purple: 70 }
end
