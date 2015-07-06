class Answer < ActiveRecord::Base
  belongs_to :users
  belongs_to :questions
  validates :body, :presence => true
end
