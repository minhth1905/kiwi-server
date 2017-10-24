class AddColumnToContent < ActiveRecord::Migration
  def change
    add_column :contents, :video, :string
  end
end
