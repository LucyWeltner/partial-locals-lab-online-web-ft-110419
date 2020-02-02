class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  # def search
  #   @students = Student.search(params[:query])
  #   if params[:query].blank?
  #     @students = Student.all
  #   end
  #   render 'index' 
  # end

  def show
    @student = Student.find(params[:id])
  end

  def index
    if !params[:query] || params[:query].blank?
        @students = Student.all
    else 
      @students = Student.search(params[:query])
    end
    render 'index'
    @students = Student.all
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
