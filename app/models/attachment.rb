class Attachment < ActiveRecord::Base
	belongs_to :log
	belongs_to :user

  has_attached_file :attachment
  validates :attachment, attachment_presence: true
  validates_attachment_file_name :attachment, matches: [
    /jpg\Z/
  ]

  validates_presence_of :log_id, :user_id 
end
