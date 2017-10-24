class AddColumnsToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :view, :integer
    add_column :portfolios, :like, :integer
  end
end
