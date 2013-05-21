class Admin < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible  :username, :password

  def self.authenticate_by_username(username, password)
  admin = find_by_username(username)
  if admin && admin.password == password
    admin
  else
    nil
  end
end

end
