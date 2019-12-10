class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
    	t.string :name
    	t.string :content
    	t.references :product

      t.timestamps
    end
  end
end
