class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.text :description
      t.text :image
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
