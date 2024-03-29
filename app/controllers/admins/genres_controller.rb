class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page]).per(8)
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admins_genres_path, notice: "作成しました"
    else
      @genres = Genre.page(params[:page]).per(8)
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admins_genres_path, notice: '更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path, notice: '削除しました'
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
