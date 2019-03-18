class AddUniqueNotNullToReferentialsSlug < ActiveRecord::Migration

  def up
    change_column_null :referentials, :slug, false
    add_index(:referentials, [:slug], unique: true) unless index_exists?(:referentials, [:slug], unique: true)
  end

end
