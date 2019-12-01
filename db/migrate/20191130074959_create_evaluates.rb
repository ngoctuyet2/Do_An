class CreateEvaluates < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluates do |t|
    	t.string :name
    	t.int :number_star
    	t.references :product
    	t.references :user
      t.timestamps
    end
  end
end
