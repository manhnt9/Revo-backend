class Api::FeeController < ApplicationController
  def index
    fee = Fee.all
    render :json => fee.to_json()
  end

  def create
    Fee.create!({ student: params[:student_id], course: params[:course_id]});
  end

  def destroy
  end
end
