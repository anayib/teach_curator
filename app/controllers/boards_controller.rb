class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /boards
  # GET /boards.json
  def index
    #@boards = Board.all
    @boards = Board.search(params[:keyword])
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @board = Board.find(params[:id])
  end

  # GET /boards/new
  def new

    @board = current_user.boards.build

    2.times {@board.lessons.build}

  end

  # GET /boards/1/edit
  def edit
    @board = Board.find(params[:id])
    if current_user == @board.user 
      render :edit
    else
      redirect_to boards_path
    end
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = current_user.boards.build(board_params)
    @board.save

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params

      params.require(:board).permit(:title, :description, :image_url, :category, :search, :level, :user_id, lessons_attributes: [:id, :title, :description, :content_format, :_destroy, :board_id, :url])

    end
end
