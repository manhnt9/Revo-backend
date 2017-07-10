class Api::StudentController < ApplicationController
  def create
    form = Form.find_by_id(params[:id])

    Student.create!({ name: form.name, parent_name: form.parent_name, dob: form.dob, phone: form.phone,
    social: form.social, course: form.course, email: form.email, note: form.note });
  end
end
