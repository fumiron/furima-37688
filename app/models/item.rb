class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery_time

  validates :image,            presence: true
  validates :name,             presence: true
  validates :description,      presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,        presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,    presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_time_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,            presence: true,
                               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
