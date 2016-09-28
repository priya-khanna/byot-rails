class TalksController < ApplicationController

  def index
    @talks = Talk.all
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def show
    @talk = Talk.find(params[:id])
  end

  def new
    @talk = Talk.new
  end

  def destroy
    Talk.find(params[:id]).delete
    redirect_to new_talk_path, flash: { success: "Submitted talk successfully deleted!" }
  end

  def create
    @talk = Talk.new(create_params)
    if @talk.save
      redirect_to talk_path(@talk.id), flash: { success: "New talk submission successfully created!" }
    else
      render :new
    end
  end

  def update
    @talk = Talk.find(params[:id])
    if @talk.update_attributes(update_params)
      redirect_to talk_path(@talk.id), flash: { success: "Submitted talk successfully updated!" }
    else
      render :edit
    end
  end

  private

  def update_params
    @_update_params ||= params.require(:talk).permit(:name, :description, :source_url)
  end

  def create_params
    @_create_params ||= update_params.merge!(user_id: current_user.id, byot_schedule_id: latest_byot.id)
  end

  def latest_byot
   @_latest_byot ||= ByotSchedule.where('byot_at > ?', Time.now).last
  end
end
