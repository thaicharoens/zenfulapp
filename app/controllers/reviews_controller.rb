class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
    @product = Product.find(params[:product_id])
  end

  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product = Product.find(params[:product_id])
    @product = Product.find(params[:product_id])
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @review.update(review_params)
    redirect_to product_path(@product)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:reivew).permit(:content, :rating)
  end
end
