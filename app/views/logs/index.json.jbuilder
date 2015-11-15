json.logs @logs do |log|
  json.title log.title
  json.description log.description
  json.log_id log.id
end