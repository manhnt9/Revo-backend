class Api::PresenceController < ApplicationController
  def index
    sql = "SELECT id, name FROM students WHERE course = '" + params[:course] + "'"
    students = ActiveRecord::Base.connection.execute(sql)

    presence = Presence.find_by_date(params[:date])
    presence = nil

    if presence == nil
      result = []
      students.each do |student|
        result.push({ id: student[0], name: student[1],
        course: params[:course], presence: false})
      end
      render :json => result.to_json()
    else
      presence = presence.to_json()
      result = presence
      students.each do |student|
        presence.each do |pre|
          if pre.student == student.ind
            result.push({ id: student[0], name: student[1],
            course: params[:course], presence: true })
            p 'test'
          else
            result.push({ id: student[0], name: student[1],
            course: params[:course], presence: false})
            p 'test'
          end
        end
      end
      render :json => result.to_json()
    end
  end

  def create
    Presence.create!({ student: params[:student], course: params[:course],
    date: params[:date], presence: true })
  end

  def destroy
    Presence.find_by_student_and_course_and_date(params[:student], params[:course], params[:date]).destroy()
  end
end
