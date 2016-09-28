class ByotSchedule < ActiveRecord::Base

  def self.statuses
    %w(open expired)
  end

  validates_presence_of :byot_at, :window_opens_at, :window_closes_at, :name
  validates :status, inclusion: {in: self.statuses }
  validate :valid_date
  validate :valid_submission_date
  validate :can_create_new_byot, :on => :create
  has_many :talks

  private

  def valid_date
    return true if byot_at && byot_at > (DateTime.now + 2.day)
    self.errors.add(:base, "Byot can only be scheduled with minimum 2 days of prior notice")
    false
  end

  def valid_submission_date
    return true if byot_at && window_closes_at && window_closes_at < byot_at && window_closes_at > Time.now
    self.errors.add(:base, "Submission date should fall before BYOT event")
    false
  end

  def can_create_new_byot
    latest_byot = ByotSchedule.last
    return unless latest_byot
    return true if latest_byot.byot_at < Time.now
    self.errors.add(:base, "New schedule can only be created after the upcoming BYOT")
    false
  end

end

