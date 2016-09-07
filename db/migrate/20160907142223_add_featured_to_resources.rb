class AddFeaturedToResources < ActiveRecord::Migration
  def change
    add_column :resources, :featured, :boolean, default: false
  end
end
