class CreateQuizzs < ActiveRecord::Migration
  def change
    create_table :quizzs do |t|
      t.text :question
      t.text :ans1
      t.text :ans2
      t.text :ans3
      t.text :ans4
      t.text :correctAns
      t.timestamps
    end
  end
end
