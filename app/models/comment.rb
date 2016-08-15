class Comment < ActiveRecord::Base
	attr_accessible :content, :micropost_id, :user_id

	belongs_to :micropost
    default_scope :order => 'comments.created_at DESC'

	validates :user_id, presence: true
	validates :micropost_id, presence: true
	validates :content, presence: true, length: { maximum: 140 }

end
