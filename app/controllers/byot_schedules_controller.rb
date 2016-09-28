# require_dependency "app/decorators/byot_schedule_decorator"

class ByotSchedulesController < ApplicationController
  def index
  end

  def edit
    @byot = ByotSchedule.find(params[:id])
  end

  def show
    @byot = ByotSchedule.find(params[:id])
  end

  def latest
    @byot = upcoming_byot
    @talks = @byot.talks
  end

  def new
    @byot = ByotSchedule.new
  end

  def destroy
    ByotSchedule.find(params[:id]).delete
    redirect_to new_byot_schedule_path, flash: { success: "BYOT schedule successfully deleted!" }
  end

  def create
    @byot = ByotSchedule.new(create_params)
    if @byot.save
      redirect_to byot_schedule_path(@byot.id), flash: { success: "BYOT schedule successfully created!" }
    else
      render :new
    end
  end

  def update
    @byot = ByotSchedule.find(params[:id])
    if @byot.update_attributes(update_params)
      redirect_to byot_schedule_path(@byot.id), flash: { success: "BYOT schedule successfully updated!" }
    else
      render :edit
    end
  end

  private

  def update_params
    @_update_params ||= params.require(:byot_schedule).permit(:name, :description, :byot_at, :window_closes_at)
  end

  def create_params
    @_create_params ||= update_params.merge!(status: 'open', window_opens_at: Time.now, month: Date.today.strftime("%B"))
  end

  def upcoming_byot
    @_upcoming_byot ||= params[:byot_id] ? ByotSchedule.find(params[:id]) : ByotSchedule.where('byot_at > ?', Time.now).last
  end

end
