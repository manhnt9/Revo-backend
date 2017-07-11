class Api::StudentController < ApplicationController
  def show
    student = Student.find_by_id(params[:id])
    render :json => student.to_json()
  end
  
  def create
    form = Form.find_by_id(params[:id])

    student = Student.create({ name: form.name, parent_name: form.parent_name, dob: form.dob, phone: form.phone,
    social: form.social, course: form.course, email: form.email, note: form.note })

    form.approved = true
    form.save
    Fee.create!({ student: student.id, course: student.course, has_paid: false})
  end
end
