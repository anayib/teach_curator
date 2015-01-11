class Lesson < ActiveRecord::Base
  enum content_format: [:image, :video, :url, :text]
  belongs_to :board

  validates_format_of :url, :with => URI.regexp(['http', 'https']) 

end
