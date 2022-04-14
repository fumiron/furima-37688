class Item < ApplicationRecord
  belongs_to :user
  has_one :order, dependent: :destroy

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery_time

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :delivery_time_id
  end

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
