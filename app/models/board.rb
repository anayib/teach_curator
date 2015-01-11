class Board < ActiveRecord::Base

  enum category: [:Biology, :Mathematics, :Physics, :History]
  belongs_to :user
  has_many :lessons, :dependent => :destroy
  accepts_nested_attributes_for :lessons, reject_if: lambda {|attributes| attributes['title'].blank?}, allow_destroy: true

  validates :title, :description, :image_url, :level, presence: true
  validates_format_of :image_url, :with => URI.regexp(['http', 'https']) 

end
