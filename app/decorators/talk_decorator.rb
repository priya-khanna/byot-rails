require_dependency 'application_decorator'
class TalkDecorator < ApplicationDecorator

  protected
  def attributes_for_output
    %w(name source_url description)
  end

end
