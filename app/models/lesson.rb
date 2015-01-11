class Lesson < ActiveRecord::Base
  enum content_format: [:WebSite_Pre_View, :YouTube_Video, :Link_to_Website]
  belongs_to :board

  validates_format_of :url, :with => URI.regexp(['http', 'https']) 

end
