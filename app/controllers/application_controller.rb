class ApplicationController < ActionController::API
  before_action :require_login
 
  private
 
  def require_login
    if !Session.find_by_token(params[:token])
      render :json => { error: 'Not authorized' }
    end
  end
end
