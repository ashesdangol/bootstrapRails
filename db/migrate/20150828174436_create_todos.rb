class CreateTodos < ActiveRecord::Migration
  def up
    create_table :todos do |t|

      t.timestamps
      t.string :title
      t.text :notes
    end
  end

  def down
  	drop_table :todos
  end
end
