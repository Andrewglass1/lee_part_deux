class ProjectsController < ApplicationController

	before_filter :redirect_unless_admin, :only => [:new, :manage, :edit, :destroy, :update, :create]

	def index
		@project_bucket_1,
		@project_bucket_2,
		@project_bucket_3 = Project.in_three_buckets
	end

	def show
		@project = Project.find_by_slug(params[:slug])
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find_by_slug(params[:slug])
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to manage_projects_path
	end

	def update
		@project = Project.find(params[:id])
		if @project.update(project_params)
			redirect_to manage_projects_path
		else
			render "edit"
		end
	end

	def create
  	@project = Project.new(project_params)
 
	  if @project.save
	    redirect_to new_project_path
	    flash[:notice] = "You have successfully added a project <a href='/projects/#{@project.slug}'>#{@project.name}</a>"
	  else
	    render 'new'
	    flash[:notice] = "There was an issue in adding the project"
	  end
	end

	def manage
		@projects = Project.all
	end

private
  def project_params
    allow = [:name, :slug, :image_1, :image_2, :image_3, :image_4, :description, :order]
    params.require(:project).permit(allow)
  end
end
