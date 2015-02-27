class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true, index:true

  validates :user, presence: true
end
