class Api::CourseController < ApplicationController
  def index
    sql = "SELECT DISTINCT course FROM students"
    courses = ActiveRecord::Base.connection.execute(sql)
    render :json => courses.to_json()
  end

end
