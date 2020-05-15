class WorksController < ApplicationController
  def index
    @works = Work.all
  end 
  
  def show 
    work_id = params[:id]
    @work = Work.find_by(id: work_id)
    if @work.nil?
      head :not_found 
      return
    end
    
  end 
  
  def new 
    @work = Work.new
  end 
  def create 
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
      return
      flash[:success] = "Successfully created #{@work.category}#{@work.title}"
    else 
      render :new, status: :bad_request       
      return 
    end 
  end 
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
