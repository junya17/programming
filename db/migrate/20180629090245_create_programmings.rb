class CreateProgrammings < ActiveRecord::Migration[5.1]
  def change
    create_table :programmings do |t|
      t.text :title
      t.text :question
      t.text :answer
      t.text :url

      t.timestamps
    end
  end
end
