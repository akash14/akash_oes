class Quizz < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :ans1, :ans2, :ans3, :ans4, :correctAns, :question
validates_presence_of :question, :ans1, :ans2 
validates_numericality_of :correctAns
end
