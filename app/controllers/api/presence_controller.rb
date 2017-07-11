class Api::PresenceController < ApplicationController
  def index
    sql = "SELECT id, name FROM students WHERE course = '" + params[:course] + "'"
    students = ActiveRecord::Base.connection.execute(sql)
    presence = Presence.where(["date = ?", params[:date]])

    result = []
    if presence.empty?
      students.each do |student|
        result.push({ student: student[0].to_s, name: student[1],
        course: params[:course], presence: false})
      end
      render :json => result.to_json()
    else
      students.each do |student|
        result.push({ student: student[0].to_s, name: student[1],
        course: params[:course], presence: false})
      end
      result.each do |res|
        presence.each do |pre|
          if res[:student] == pre.student
            res[:presence] = true
          end
        end
      end
      render :json => result.to_json()
    end
  end

  def create
    Presence.create!({ student: params[:student], course: params[:course],
    date: params[:date]})
  end

  def destroy
    Presence.find_by_student_and_course_and_date(params[:student], params[:course], params[:date]).destroy()
  end
end
