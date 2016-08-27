class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.belongs_to :section, index: true
      t.string :name
      t.datetime :date
      t.binary :thumbnail
      t.string :title
      t.timestamps
    end
  end
end
