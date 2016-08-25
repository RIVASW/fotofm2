class ImagesController < ApplicationController
before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
    send_data(@image.file_contents,
              type: @image.mime_type,
              filename: @image.filename)
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to images_path, notice: 'image was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'image was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
    end
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:file)
    end
end
