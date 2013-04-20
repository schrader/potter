module PotsHelper
  def random_illustration
    illustrations = %w(bag.png book.png calendar.png  clipboard.png colors.png compass.png gift.png infinity.png  mail.png map.png paper.png retina.png share.png time.png)
    raw image_tag("/illustrations/#{illustrations.sample}", class: "illustrations")
  end
end
