class EntriesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @entry = current_user.entries.build entry_params
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      flash[:error] = "False!"
      redirect_to root_path
    end
  end

  def destroy 
    @entry.destroy
    flash[:success]="Entry deleted"
    redirect_to request.referrer || root_url
  end

  def show 
    @entry = Entry.find params[:id]
    @comment = @entry.comments.build
    @comments = @entry.comments.paginate page: params[:page]
  end

  private
  def entry_params
    params.require:entry.permit :title, :body, :picture
  end

  def correct_user 
    @entry = current_user.entries.find_by id: params[:id]
    redirect_to root_url if @entry.nil?
  end
end
