class CreateUsers < ActiveRecord::Migration
   def self.up
    create_table :users do |t|
      t.column :username, :string
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.column :count, :integer, :default => 0, :null => false
      t.column :attempts, :integer, :default => 0, :null => false
    end
  end

  def self.down
    drop_table :users
  end
end
