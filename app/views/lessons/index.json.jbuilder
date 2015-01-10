json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :title, :description, :content_format, :board_id
  json.url lesson_url(lesson, format: :json)
end
