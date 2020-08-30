class Estimate < ApplicationRecord
  belongs_to :user
  has_many :images,dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
 
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to_active_hash :probability
 belongs_to_active_hash :status

  with_options presence: true do
    validates :customer
    validates :get
    validates :deadline
    validates :name
    validates :figure_number
    validates :make
    validates :metal
    validates :quantity
    validates :sell_price
    validates :purchase_price
    validates :profit
    validates :sell_price_total
    validates :profit_total
    validates :probability_id
    validates :status_id
  end

  scope :estimate, -> { order("created_at DESC")} 

end
