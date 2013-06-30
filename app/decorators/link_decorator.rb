class LinkDecorator < Draper::Decorator
  delegate_all
  decorates_association :pot

  def hottiness
    ["gut", "besser", "Lesebefehl!"][source.hottiness - 1]
  end

  def hottiness_label
    ["info", "success", "important"][source.hottiness - 1]
  end
  
  def sent_at
    "gesendet vor #{h.time_ago_in_words source.sent_at}, am #{source.sent_at.strftime('%d.%m.%Y um %H:%M Uhr')}" if source.sent_at.present?
  end
end

class LinksDecorator < Draper::CollectionDecorator
  delegate :current_page, :per_page, :offset, :total_entries, :total_pages
end