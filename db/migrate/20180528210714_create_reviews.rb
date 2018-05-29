class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :body
      
      t.references :idea, foreign_key: true, index: true

      t.timestamps
    end
  end
end
