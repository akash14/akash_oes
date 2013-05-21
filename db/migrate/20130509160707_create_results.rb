class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.column :userid, :string
      t.column :questionid, :string
      t.column :status, :string
      t.timestamps
    end
  end
end
