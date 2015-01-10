class Lesson < ActiveRecord::Base
  enum content_format: [:image, :video, :url, :text]
  belongs_to :board

end
