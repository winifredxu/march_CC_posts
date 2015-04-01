class Post < ActiveRecord::Base
  has_many :discussions, dependent: :destroy

  validates :title, length: {minimum: 10}
  validates :price, numericality: {greater_than_or_equal_to: 0}

  def self.most_recent
    order("created_at DESC")
  end

end
