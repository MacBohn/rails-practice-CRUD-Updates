class UpdatesController <ApplicationController

  def index
    @updates= Update.all
  end

  def new
    @update= Update.new
  end

  def create
    @update = Update.new(update_params)
    if @update.save
      redirect_to updates_path, notice: "Update was successfully created !"
    else
      render :new
    end
  end

  def edit
      @update = Update.find(params[:id])
  end

  def update
    update_params = params.require(:update).permit(:status, :user, :likes)
    @update = Update.find(params[:id])
    @update.update(update_params)
    redirect_to updates_path, notice: "Update was successfuly updated !"
  end

  def destroy
      @update = Update.find(params[:id])
    @update.destroy
   redirect_to updates_path, notice: "Update successfully destroyed !"
  end

  def update_params
    params.require(:update).permit(:status, :user, :likes)
  end
end
