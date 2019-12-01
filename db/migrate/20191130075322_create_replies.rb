class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
    	t.string :content
    	t.references :comment
    	t.references :user
      t.timestamps
    end
  end
end
