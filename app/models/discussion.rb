class Discussion < ActiveRecord::Base
  belongs_to :post

  validates :title, presence: true
end
