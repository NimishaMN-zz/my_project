class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
    	t.string :title
    	t.string :description
    	t.integer :time_seconds
    	t.integer :author_id, :null => false
    	t.integer :publisher_id, :null => false
    	t.string :content_format
      t.timestamps
    end
  end
end
