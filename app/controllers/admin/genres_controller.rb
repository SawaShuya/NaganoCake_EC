class Admin::GenresController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_genres, only: [:index]
	before_action :set_genre, only: [:index, :edit, :update]

	def index;end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			flash[:notice] = "create genre successfully"
			redirect_to admin_genres_path
		else
			set_genre
			render "index"
		end
	end

	def edit;	end

	def update
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

	def set_genres
		@genres = Genre.all
	end

	def set_genre
		@genre = Genre.find_or_initialize_by(id: params[:id])
	end
end
