class AddColumnToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :video, :string
  end
end
