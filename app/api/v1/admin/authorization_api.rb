class V1::Admin::AuthorizationAPI < Grape::API
  desc "Admin login API"
  params do
    requires :email, type: String
    requires :password, type: String
  end
  post :login do
    user = User.find_by email: params.dig(:email), password: params.dig(:password)

    raise APIError::Unauthorized unless user
    {user_token: UserTokenSerializer.new(user.user_tokens.generate)}
  end

  desc "Admin logout API"
  post :logout do
    current_user.user_tokens.find_by!(token: access_token_header).expire!
    {}
  end
end
