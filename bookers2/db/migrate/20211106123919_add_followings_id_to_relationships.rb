class AddFollowingsIdToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :followings_id, :integer
  end
end
