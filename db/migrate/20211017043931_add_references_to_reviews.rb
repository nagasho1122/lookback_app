class AddReferencesToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :subject, null: true, foreign_key: true
  end
end
