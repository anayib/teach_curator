json.array!(@boards) do |board|
  json.extract! board, :id, :title, :description, :image_url, :category, :level, :user_id
  json.url board_url(board, format: :json)
end
