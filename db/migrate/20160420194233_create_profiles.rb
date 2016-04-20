class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.string :bio
      t.string :avatar

      t.timestamps null: false
    end
  end
end
