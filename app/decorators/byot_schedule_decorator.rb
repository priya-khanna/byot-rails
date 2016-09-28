require_dependency 'application_decorator'
class ByotScheduleDecorator < ApplicationDecorator
  delegate :talks, to: :model

  protected
  def attributes_for_output
    %w(name byot_at window_closes_at description status)
  end

end
