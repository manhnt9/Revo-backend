class Api::FormController < ApplicationController
  def index
    forms = Form.all
    render :json => forms.to_json()
  end

  def create
    Form.create!({ name: params[:name], parent_name: params[:parent_name], dob: params[:dob], phone: params[:phone], 
    social: params[:social], course: params[:course], note: params[:note], email: params[:email]});
  end
end
