class Api::FormController < ApplicationController
  def index
		reply = { 'test': 1234 }
		render :json => reply
  end

  def create
    Form.create!(params);
  end
end
