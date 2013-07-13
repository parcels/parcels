require 'barby/barcode/code_39'
require 'barby/outputter/svg_outputter'

class ParcelDecorator < Draper::Decorator
  delegate_all
  decorates_association :operations

  def barcode_svg
    xdim = barcode.size == 13 ? 1.55 : 1.4
    Barby::Code39.new(barcode).to_svg(height: 50, xdim: xdim, margin: 0)
  end

  def barcode_splitted
    barcode.scan(/[A-Z]{2}|\d{3}|.+/).join(' ')
  end

  def country_name
    country.try(:name)
  end

  def days_in_transit
    time_in_transit.to_i / 86400
  end

  def days_in_transit_in_words
    "#{h.t 'datetime.distance_in_words.x_days', count: days_in_transit} в пути"
  end
end
