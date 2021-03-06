class BoardsController < ApplicationController
  before_filter :login_required
  load_and_authorize_resource
  # GET /boards
  # GET /boards.json
  def index
#    @boards = Board.all
    store_location
    @boards = @boards.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boards }
    end
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
#    @board = Board.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @board }
    end
  end

  # GET /boards/new
  # GET /boards/new.json
  def new
#    @board = Board.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @board }
    end
  end

  # GET /boards/1/edit
  def edit
#    @board = Board.get(params[:id])
  end

  # POST /boards
  # POST /boards.json
  def create
#    @board = Board.new(params[:board])
    @board.user = current_user
    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render json: @board, status: :created, location: @board }
      else
        format.html { render action: "new" }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /boards/1
  # PUT /boards/1.json
  def update
#    @board = Board.get(params[:id])

    respond_to do |format|
      if @board.update(params[:board])
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
#    @board = Board.get(params[:id])
    @board.destroy

    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully deleted.' }
      format.json { head :ok }
    end
  end
end
