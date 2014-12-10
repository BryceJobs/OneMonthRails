class Pin < ActiveRecord::Base
	belongs_to :user

	if Rails.env.development?
		has_attached_file :image,
			styles: {medium: '220x240>', normal: '530x600>'}
	else
		has_attached_file :image, 
			storage: :dropbox,
			dropbox_credentials: Rails.root.join('config/dropbox.yml'),
			styles: {medium: '220x240>', normal: '530x600>'},
			path: ":class/:style/:id_:filename"
	end


	validates :description, presence: true
	validates :user_id, presence: true
	validates_attachment :image,
										  presence: true,
											size: {less_than: 5.megabytes}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	def image_remote_url=(url_value)
		self.image = URI.parse(url_value) unless url_value.blank?
		super
	end
end
