class Api::SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session = Session.create!({ user_id: user.id })
      reply = {'token': session.token}
      render :json => reply
    else
      reply = {'result': 'failure'}
      render :json => reply
    end
  end

  def destroy
    Session.find_by_token(params[:token]).destroy()
  end
end
