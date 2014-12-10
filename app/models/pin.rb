class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, 
		storage: :dropbox,
		dropbox_credentials: Rails.root.join('config/dropbox.yml'),
		styles: {medium: '220x240>', normal: '530x600>'},
		path: ":class/:attachment/:id_partition/:style/:filename"


	validates :description, presence: true
	validates :user_id, presence: true
	validates_attachment :image,
										  presence: true,
											size: {less_than: 5.megabytes}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
