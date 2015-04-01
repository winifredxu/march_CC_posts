class Comment < ActiveRecord::Base
  belongs_to :discussion

  validates :body, presence: true

  # this will give you the post of the discussion that this comment 
  # is associated with
  def post
    discussion.post
  end

end
