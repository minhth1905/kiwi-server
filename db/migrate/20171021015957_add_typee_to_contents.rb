class AddTypeeToContents < ActiveRecord::Migration
  def change
    add_column :contents, :typee, :integer
  end
end
