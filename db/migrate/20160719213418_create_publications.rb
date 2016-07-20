class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :category
      t.string :medium
      t.string :url

      t.timestamps null: false
    end
  end
end
