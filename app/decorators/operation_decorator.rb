class OperationDecorator < Draper::Decorator
  delegate_all

  def mass_in_kgs
    (mass / 1000.0).to_s.gsub(/\./, ',') if mass
  end
end
