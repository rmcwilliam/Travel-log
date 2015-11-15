json.logs @logs do |deck|
  json.title log.title
  json.description log.description
  json.log_id log.id
end