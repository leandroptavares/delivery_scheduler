class Delivery < ApplicationRecord
  validates :pickup_address, presence: true
  validates :delivery_address, presence: true
  validate :pickup_and_delivery_addresses_must_differ
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :distance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :scheduled_time, presence: true
  validate :scheduled_time_must_be_in_future
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_validation :calculate_cost

  private

  def pickup_and_delivery_addresses_must_differ
    if pickup_address == delivery_address
      errors.add(:delivery_address, "cannot be the same as pickup address")
    end
  end

  def scheduled_time_must_be_in_future
    if scheduled_time.present? && scheduled_time < 1.day.from_now.beginning_of_day
      errors.add(:scheduled_time, "must be greater than the current date")
    end
  end

  def calculate_cost
    if distance.present? && weight.present?
      rate_per_km = 0.5
      rate_per_kg = 0.2
      self.cost = (distance * rate_per_km) + (weight * rate_per_kg)
    end
  end
end
