class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false
      t.belongs_to :presentation, null: false
      t.text :body

      t.timestamps null: false
    end
  end
end
