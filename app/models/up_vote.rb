class UpVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :user, presence: true
  validates :votable, presence: true
end
