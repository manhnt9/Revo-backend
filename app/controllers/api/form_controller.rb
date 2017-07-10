class Api::FormController < ApplicationController
  def index
    if Session.find_by_token(params[:token])
      forms = Form.all
      render :json => forms.to_json()
    end
  end

  def show
    if Session.find_by_token(params[:token])
      form = Form.find_by_id(params[:id])
      render :json => form.to_json()
    end
  end

  def create
    Form.create!({ name: params[:name], parent_name: params[:parent_name], dob: params[:dob], phone: params[:phone], 
    social: params[:social], course: params[:course], note: params[:note], email: params[:email] });
  end
end
