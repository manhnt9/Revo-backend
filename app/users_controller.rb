class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if (@user.save)
      reply = { 'result': 'success'}
      render :json => reply
    else
      reply = { 'result': 'failure'}
      render :json => reply
    end
end
