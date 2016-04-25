class AddAvatarLinkToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :avatar_link, :string
  end
end
