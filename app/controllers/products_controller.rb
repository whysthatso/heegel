class ProductsController < ApplicationController
  before_filter :authorize, except: :index

  def index
    @products = Product.order("position")

    respond_to do |format|
      format.html 
      format.json { render json: @products }
    end
  end

  def new
    @product = Product.new

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  #update order after sorting products
  def sort
  params[:product].each_with_index do |id, index|
    Product.update_all({position: index+1}, {id: id})
  end
  render nothing: true
  end
end
