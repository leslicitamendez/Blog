class PostsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to '/posts', notice: 'La publicación ha sido creada exitosamente'
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
		if @post.update(post_params)
			redirect_to '/posts', notice: 'La publicación ha sido actualizada exitosamente'
		else
			render 'edit'
		end
	end

	def delete
		@post = Post.find(params[:id])
		if @post.destroy
			redirect_to '/posts', notice: 'La publicación ha sido borrada exitosamente'
		else
			redirect_to '/posts', notice: 'No se pudo borrar la publicación'
		end
	end

	def like
		@post = Post.find(params[:id])
		@post.like = @post.like ? @post.like+1 : 1
		@post.save
		redirect_to '/'
	end

	def dislike
		@post = Post.find(params[:id])
		@post.like = @post.like!=0 ? @post.like-1 : @post.like
		if @post.save
			redirect_to '/', notice: 'Se borro un Me Gusta'
		else
			render 'index'
		end
	end

	private
		def post_params
			params.require(:post).permit(:title, :text, :category)
		end
end
