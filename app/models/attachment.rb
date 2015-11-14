class Attachment < ActiveRecord::Base
	belongs_to :log
	belongs_to :user
end
