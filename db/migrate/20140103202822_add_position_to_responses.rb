class AddPositionToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :position, :integer, null: false, default: 1
  end
end
