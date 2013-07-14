module LinksHelper
  def archive_weeks
    Link.where(pot_id: current_pot).uniq(:sent_at).order(sent_at: :desc).pluck(:sent_at).compact.map{|date| LinksController::CalendarWeek.new(date)}
  end

  def archive_weeks_grouped_by_years_and_months
    years = archive_weeks_grouped_by_years
    archive_weeks_grouped_by_years.each do |year, weeks|
      years[year] = weeks.group_by do |week|
        week.strftime("%B")
      end
    end
    years
  end

  def archive_weeks_grouped_by_years
    archive_weeks.group_by do |week|
      week.strftime("%Y")
    end
  end
end
