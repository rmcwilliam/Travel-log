class Attachment < ActiveRecord::Base
	belongs_to :log
	belongs_to :user

  has_attached_file :attachment
  validates :attachment, attachment_presence: true
  do_not_validate_attachment_file_type :attachment

  validates_presence_of :log_id, :user_id 
end
