class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:title, :text))
		if @post.save
			redirect_to '/posts', notice: 'La publicacion ha sido creada exitosamente'
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :text))
			redirect_to '/posts', notice: 'La publicacion ha sido actualizada exitosamente'
		else
			render 'edit'
		end
	end

	def delete
		@post = Post.find(params[:id])
		if @post.destroy
			redirect_to '/posts', notice: 'La publicacion ha sido borrada exitosamente'
		else
			redirect_to '/posts', notice: 'No se pudo borrar la publicacion'
		end
	end

	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
