module QiitaScouter
  # QiitaScouter::Article
  class Article
    attr_accessor :tags, :stock_count

    def initialize(options = {})
      @tags = options['tags'].map { |e|e['name'] }
      @stock_count = options['likes_count']
    end
  end
end
