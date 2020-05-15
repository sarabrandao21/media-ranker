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
      flash[:success] = "Successfully created #{@work.category}#{@work.title}"
      return
    else 
      flash.now[:error] = "NOT successfully created #{@work.category}#{@work.title}"
      render :new, status: :bad_request 
      return 
    end 
  end 
  def edit
    @work = Work.find_by(id: params[:id])
    
    if @work.nil?
      head :not_found
      return
    end
  end
  
  def update
    
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    elsif @work.update(work_params)
      redirect_to work_path(@work.id) 
      flash[:success] = "Successfully updated #{@work.category}#{@work.title}"
      return
    else
      flash.now[:error] = "NOT successfully updated #{@work.category}#{@work.title}"
      render :edit
      return
    end
  end
  
  def destroy
    work_id = params[:id]
    @work =  Work.find_by(id: work_id) 
    
    if @work.nil?
      head :not_found  
      return
    end
    
    @work.destroy
    
    redirect_to works_path
    return
  end 
  
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
