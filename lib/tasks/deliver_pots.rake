namespace :pots do
  desc "delivers pots"
  task deliver_weekly: :environment do

    Pot.where(delivery_day: Date.today.strftime("%A").downcase, delivery_hour: Time.now().strftime("%H")).each do |pot|
      pot.users.each do |user|
        PotMailer.weekly(pot, user).deliver
      end

      pot.markoff_new_links

      pot.update(last_delivered_at: Time.zone.now)
    end
  end
  

  task all: :environment do
    Pot.all.each do |pot|
      pot.users.each do |user|
        PotMailer.weekly(pot, user).deliver
      end

      #pot.update(last_delivered_at: Time.zone.now)
    end
  end
end