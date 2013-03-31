class LinkDecorator < Draper::Decorator
  delegate_all
  decorates_association :pot
  
  def hottiness
    ["gut", "nicer Shit", "Lesebefehl!"][source.hottiness - 1]
  end

  def hottiness_label
    ["info", "success", "important"][source.hottiness - 1]
  end
  
  def sent_at
    "gesendet vor #{h.time_ago_in_words source.sent_at}, am #{source.sent_at.strftime('%d.%m.%Y um %H:%M Uhr')}" if source.sent_at.present?
  end
end
