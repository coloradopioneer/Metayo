class TagsController < ApplicationController

	def show
		@tag = Tag.find(params[:id])
		@posts = @tag.posts.paginate(page: params[:page], per_page: 4)
	end

	def new
		@tag = Tag.new
	end

def create
	@tag = Tag.new(tag_params)
	if @tag.save
		flash[:success] = "Tag Created Successfully."
		redirect_to posts_path
	else
		render 'new'
	end
end

private

	def tag_params
		params.require(:tag).permit(:name)
	end

end