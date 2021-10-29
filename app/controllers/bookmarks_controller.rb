class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  before_action :set_bookmark, only: :destroy

  # GET /lists/bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # POST /lists/bookmarks/
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    flash[:notice] = @bookmark.errors.full_messages.to_sentence unless @bookmark.save
    redirect_to list_path(@list)
  end

  # DELETE /lists/bookmarks/:id
  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  # Only allow a list of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
  
  # Use callbacks (before_action) to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
