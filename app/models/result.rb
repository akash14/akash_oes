class Result < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :userid, :questionid, :status 

  validates_presence_of :userid, :on => :create
  validates_presence_of :questionid, :on => :create
  validates_presence_of :status, :on => :create
  
end
