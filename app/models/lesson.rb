class Lesson < ActiveRecord::Base
  enum content_format: [:WebSite_Pre_View, :YouTube_Video, :Link_to_Website]
  belongs_to :board

end
