class PotDecorator < Draper::Decorator
  decorates_association :links
  delegate_all

  def delivery_hour
    source.delivery_hour.to_s + ":00 Uhr"
  end
  
  def next_delivery_date
    "wird nächsten #{h.t source.delivery_day} um #{source.delivery_hour}:00 Uhr gesendet"
  end
  
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
