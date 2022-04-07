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
  validates :category_id,      presence: true
  validates :status_id,        presence: true
  validates :postage_id,       presence: true
  validates :prefecture_id,    presence: true
  validates :delivery_time_id, presence: true
  validates :price,            presence: true
end
