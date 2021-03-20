class Admin::GenresController < ApplicationController

	def index
		@genres = Genre.all
		@genre_new = Genre.new
	end

	def create
		@genre_new = Genre.new(genre_params)
		if @genre_new.save
			flash[:notice] = "create genre successfully"
			redirect_to admin_genres_path
		else
			@genres = Genre.all
			render "index"
		end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			flash[:notice] = "create genre successfully"
			redirect_to admin_genres_path
		else
			render "edit"
		end
	end

	private
	def genre_params
		params.require(:genre).permit(:name, :is_active)
	end

end
