json.data do

  json.current_user do
    json.partial! "api/v1/users/user", user: current_user
  end

  json.user do
    json.partial! "api/v1/users/user", user: @user
  end
end