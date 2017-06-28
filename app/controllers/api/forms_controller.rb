class Api::FormsController < ApplicationController
  def index
		reply = { 'test': 1234 }
		render :json => reply
  end
end
