class ItemsController < ApplicationController
  before_filter :login_required
  load_and_authorize_resource :board
  load_and_authorize_resource :through => :board
  # GET /items
  # GET /items.json
  def index
#    @items = Item.all
    store_location
    @items = @items.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
#    @item = Item.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
#    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
#    @item = Item.get(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
#    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to({action: :show, id: @item}, notice: 'Item was successfully created.') }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
#    @item = Item.get(params[:id])

    respond_to do |format|
      if @item.update(params[:item])
        format.html { redirect_to({action: :show, id: @item}, notice: 'Item was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
#    @item = Item.get(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to({action: :index}, notice: 'Item was successfully deleted.')  }
      format.json { head :ok }
    end
  end
end
