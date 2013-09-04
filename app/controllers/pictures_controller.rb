class PicturesController < ApplicationController

	def new
    	@picture = Picture.new
  	end

	params.require( ).permit( ) structure:


	def create
		@picture = Picture.new(params.require(:picture).permit(:title, :artist, :url))
		if @picture.save
			redirect_to pictures_url
		else
			render :new
		end
	end

	def update
		@picture = Picture.find(params[:id])
		if @picture.update_attributes(params.require(:picture).permit(:title, :artist, :url))
			redirect_to "/pictures/#{@picture.id}"
		else
			render :edit
		end
	end
 

  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end


	def edit
	    @picture = Picture.find(params[:id])
	  end

	  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end
end