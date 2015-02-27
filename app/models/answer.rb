class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :content, presence: true
  validates :user, presence: true
  validates :question, presence: true
end
