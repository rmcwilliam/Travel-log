class Log < ActiveRecord::Base
	belongs_to :user
	has_many :attachments

	validates_presence_of :title
end
