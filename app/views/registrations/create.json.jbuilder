json.user do
  json.user_id @user.id	
  json.username @user.username
  json.email @user.email
  json.access_token @user.access_token
end