class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :link
      t.text :content
      t.text :description
      t.references :portfolio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
