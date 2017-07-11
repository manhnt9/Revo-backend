class Api::FeeController < ApplicationController
  def index
    fee = Fee.all
    render :json => fee.to_json()
  end

  def update
    fee = Fee.find_by_student(params[:student])
    fee.has_paid = !fee.has_paid
    fee.save()
  end
end
