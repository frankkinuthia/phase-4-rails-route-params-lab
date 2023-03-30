class StudentsController < ApplicationController

  def index
    students = Student.all
   

    # check first whether the `name ` param is present. If it is, use `where` to search for students whose first/last name matches the query param

    if params[:name].present?
      # `LIKE` operator with the % wildcards to find partial matches
      students = students.where("first_name LIKE ? OR last_name LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
    else
      # if name param is not present, return all students
      students = Student.all
    end
    # render list as JSON
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end


end
