class Discussion < ActiveRecord::Base
  belongs_to :post
  has_many :comments, dependent: :destroy

  validates :title, presence: true
end
