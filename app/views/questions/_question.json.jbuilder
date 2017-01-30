json.extract! question, :id, :question, :weight, :created_at, :updated_at
json.url question_url(question, format: :json)