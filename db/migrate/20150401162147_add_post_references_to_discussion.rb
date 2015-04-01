class AddPostReferencesToDiscussion < ActiveRecord::Migration
  def change
    add_reference :discussions, :post, index: true, foreign_key: true
  end
end
