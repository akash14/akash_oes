class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
	  t.column :username, :string, :null => false
      t.column :password, :string, :null => false
    end
  end
end
