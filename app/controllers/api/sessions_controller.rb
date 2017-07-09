class Api::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      reply = {'result': 'success'}
      render :json => reply
    else
      reply = {'result': 'failure'}
      render :json => reply
    end
  end
end
