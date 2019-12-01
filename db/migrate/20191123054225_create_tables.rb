class CreateTables < ActiveRecord::Migration[5.1]
  def change
	create_table :categories do |t|
    	t.string :name
    	t.timestamps
    end  	

    create_table :products do |t|
    	t.string :name
    	t.int :price
    	t.string :description
    	t.references :category
    	t.attachment :image
    	t.timestamps
    end
  end
end
