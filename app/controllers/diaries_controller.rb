class DiariesController < ApplicationController
  before_action :set_diary, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @diary.comments
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to diary_path(@diary)
    else
      render :edit
    end
  end

  def destroy
    if @diary.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :text, :image).merge(user_id:current_user.id)
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @diary.user
  end
end
end
