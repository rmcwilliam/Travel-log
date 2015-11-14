class Log < ActiveRecord::Base
	belongs_to :user
	has_many :attachments, :through => :users

	validates_presence_of :title
end
