class AddUserToPresentation < ActiveRecord::Migration
  def change
    add_column :presentations, :user_id, :integer, null: false
  end
end
