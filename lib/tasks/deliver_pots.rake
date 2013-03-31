namespace :pots do
  desc "delivers pots"
  task deliver_weekly: :environment do
    puts Pot.where(delivery_day: Date.today.strftime("%A").downcase, delivery_hour: Time.now().strftime("%H")).explain
    Pot.where(delivery_day: Date.today.strftime("%A").downcase, delivery_hour: Time.now().strftime("%H")).each do |pot|
      pot.users.each do |user|
        PotMailer.weekly(pot, user).deliver
      end
      
      pot.markoff_links
    end
  end
  

  task all: :environment do
    Pot.all.each do |pot|
      pot.users.each do |user|
        PotMailer.weekly(pot, user).deliver
      end
    end
  end
end