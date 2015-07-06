class Question < ActiveRecord::Base
  belongs_to :user
  validates :title, :presence => true
  validates :body, :presence => true
  has_many :answers
end
