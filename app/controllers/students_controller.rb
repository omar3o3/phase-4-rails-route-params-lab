class StudentsController < ApplicationController

  def index
    if params.has_key?(:name)
      # byebug
      search = params[:name].capitalize()

      render json: Student.where(first_name: search).or(Student.where(last_name: search))
      # if (Student.where("first_name = ?", search))
      #   render json: Student.find_by(first_name: search)
      # elsif (Student.where("last_name = ?", search))
      #   render json: Student.find_by(last_name: search)
      # end
    else
      render json: Student.all
    end
  end

  def show_student_by_id
    render json: Student.find(params[:id])
  end

end

# render json: Student.find_by(first_name: params[:name])
# render json: Student.find_by(last_name: params[:name])
