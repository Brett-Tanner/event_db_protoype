class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end
  
  def show
    @school = School.find(params[:id])
  end
  
  def new
    @school = School.new
  end
  
  def create
    @school = School.new(school_params)

    if @school.save
      flash[:notice] = "You created #{@school.name} school"
      redirect_to school_path(@school)
    else
      flash.now[:alert] = "Could not create school"
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @school = School.find(params[:id])
  end
  
  def update
    @school = School.find(params[:id])

    if @school.update(school_params)
      flash[:notice] = "#{@school.name} updated successfully"
      redirect_to school_path(@school)
    else
      flash.now[:alert] = "Could not update school"
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @school = School.find(params[:id])
    
    if @school.destroy
      flash[:notice] = "Successfully removed school"
      redirect_to root_path
    else
      flash.now[:alert] = "Could not delete school"
    end
  end

  private

  def school_params
    params.require(:school).permit()
  end
end
