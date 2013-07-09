class ZemantaClient < ActiveRecord::Base

  def self.generate_articles_from(context)
    Zemanta.api_key = "40lxa1dqxggsparkqe26yst8"
    suggests = Zemanta.new.suggest(context)
    suggests['articles']
  end

  def self.tag(content)
    zemanta = Zemanta.new "40lxa1dqxggsparkqe26yst8"
    suggests = zemanta.suggest(content)
    res = []
    suggests['keywords'].each {|k|
      res << k['name'].downcase.gsub(/\s*\(.*?\)/,'').strip if k['confidence'] > 0.02
    }
    res
  end
end