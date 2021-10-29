class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/:id
  def show
    @bookmark = Bookmark.new
    @review = Review.new
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/:id/edit
  def edit
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'list was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lists/:id
  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'list was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lists/:id
  def destroy
    @list.destroy
    redirect_to lists_url, notice: 'list was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name)
    end
end
