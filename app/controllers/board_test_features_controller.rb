class BoardTestFeaturesController < ApplicationController
  before_filter :login_required
  load_and_authorize_resource :board
  load_and_authorize_resource :through => :board, :through_association => :test_features
  # GET /board_test_features
  # GET /board_test_features.json
  def index
    redirect_to board_path(@board)
  end

  # GET /board_test_features/1
  # GET /board_test_features/1.json
  def show
#    @board_test_feature = BoardTestFeature.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @board_test_feature }
    end
  end

  # GET /board_test_features/new
  # GET /board_test_features/new.json
  def new
#    @board_test_feature = BoardTestFeature.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @board_test_feature }
    end
  end

  # GET /board_test_features/1/edit
  def edit
#    @board_test_feature = BoardTestFeature.get(params[:id])
  end

  # POST /board_test_features
  # POST /board_test_features.json
  def create
#    @board_test_feature = BoardTestFeature.new(params[:board_test_feature])
    respond_to do |format|
      if @board_test_feature.save
        format.html { redirect_to @board, notice: 'Board test feature was successfully created.' }
        format.json { render json: @board_test_feature, status: :created, location: @board_test_feature }
      else
        format.html { render action: "new" }
        format.json { render json: @board_test_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /board_test_features/1
  # PUT /board_test_features/1.json
  def update
#    @board_test_feature = BoardTestFeature.get(params[:id])

    respond_to do |format|
      if @board_test_feature.update(params[:board_test_feature])
        format.html { redirect_to @board, notice: 'Board test feature was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @board_test_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_test_features/1
  # DELETE /board_test_features/1.json
  def destroy
#    @board_test_feature = BoardTestFeature.get(params[:id])
    @board_test_feature.destroy

    respond_to do |format|
      format.html { redirect_to @board, notice: 'Board test feature was successfully deleted.' }
      format.json { head :ok }
    end
  end
end
