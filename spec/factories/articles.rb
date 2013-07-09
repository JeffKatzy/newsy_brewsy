# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "Lecavalier deal looks like a good one for the Flyers"
    url "http://www.philly.com/philly/sports/flyers/20130703_Lecavalier_deal_looks_like_a_good_one_for_the_Flyers.html"
    text_preview "LAST SUMMER, Paul Holmgren put all his eggs in one basket, going after Ryan Suter and Zach Parise, who both landed in Minnesota on dual $98 million deals. This summer, Holmgren took a stab at the biggest free agent on the market. Apparently, his wait-and-see approach paid off."
    tag_id 1
  end
end
