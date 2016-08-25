class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename
      t.string :mime_type
      t.binary :file_contents

      t.timestamps
    end
  end
end
