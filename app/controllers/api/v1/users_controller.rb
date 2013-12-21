class Api::V1::UsersController < Api::V1::ApiController

  skip_filter :authenticate_current_user, only: [:create, :login]

  def me
    @user = current_user
  end

  def login
    @user = self.current_user = User.authenticate params[:email], params[:password]
    if current_user
      render :me
    else
      render_api_errors t('api.error_title'), [t("api.invalid_creds")]
    end
  end

  def create
    @user = User.new params[:user]
    if @user.save
      render :me, status: :created
    else
      render_api_errors t('api.error_title'), @user.errors
    end
  end

  def update
    @user = current_user
    if @user.update_attributes params[:user]
      render :me
    else
      render_api_errors t('api.error_title'), @user.errors
    end
  end
end