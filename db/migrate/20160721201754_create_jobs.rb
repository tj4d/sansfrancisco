class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :companyName
      t.string :positionTitle
      t.string :positionDescription
      t.string :location
      t.string :category
      t.string :url

      t.timestamps
    end
  end
end
