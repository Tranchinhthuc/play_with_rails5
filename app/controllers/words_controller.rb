class WordsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_word, :except => [:create, :index]

  def index
    words = current_user.words
    render json: words
  end

  def show
    render json: @word
  end

  def create
    word = current_user.words.build word_params
    if word.save
      render json: word
    else
      render json: {error: word.errors.messages}, status: 422
    end
  end

  def update
    if @word.update_attributes(word_params)
      render json: @word
    else
      render json: {error: @word.errors.messages}, status: 422
    end
  end

  def update_meaning
    if @word.update_attributes(meaning: params[:meaning])
      render json: @word
    else
      render json: {error: @word.errors.messages}, status: 422
    end
  end

  def update_status
    if @word.update_attributes(status: params[:status])
      render json: @word
    else
      render json: {error: @word.errors.messages}, status: 422
    end
  end

  def update_origin
    if @word.update_attributes(meaning: params[:origin])
      render json: @word
    else
      render json: {error: @word.errors.messages}, status: 422
    end
  end

  def destroy
    if @word.destroy
      render json: @word
    else
      render json: {error: "Can't delete this word"}, status: 422
    end
  end

  private
  def word_params
    params.require(:word).permit(:origin, :meaning, :status)
  end

  def find_word
    @word = Word.find params[:id]
  end
end
