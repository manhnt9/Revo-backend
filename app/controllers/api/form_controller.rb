class Api::FormController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def index
    forms = Form.all
    render :json => forms.to_json()
  end

  def show
   form = Form.find_by_id(params[:id])
   render :json => form.to_json()
  end

  def create
    Form.create!({ name: params[:name], parent_name: params[:parent_name], dob: params[:dob], phone: params[:phone], 
    social: params[:social], course: params[:course], note: params[:note], email: params[:email] });
  end
end
