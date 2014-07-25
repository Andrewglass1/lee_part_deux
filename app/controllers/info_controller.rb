class InfoController < ApplicationController
	before_filter :redirect_unless_admin, :only => [:edit, :update]

	def index
		@info_content = InfoContent.first
	end

	def edit
		@info_content = InfoContent.first
	end

	def update
		@info_content = InfoContent.first
		if @info_content.update(info_content_params)
			redirect_to info_index_path
		else
			redirect_to :back
		end
	end

	private
	def info_content_params
		allow = [:column_1, :column_2, :column_3]
		params.require(:info_content).permit(allow)
	end
end
