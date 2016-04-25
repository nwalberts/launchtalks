class AddVideoToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :video, :string
  end
end
