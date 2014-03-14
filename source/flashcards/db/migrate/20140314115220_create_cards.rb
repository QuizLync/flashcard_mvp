class CreateCards < ActiveRecord::Migration
  def change
    create_tables :cards do |t|
      t.text :question
      t.string :answer
      t.timestamps
      t.belongs_to :deck
    end
  end
end
