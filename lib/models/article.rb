module QiitaScouter
  # QiitaScouter::Article
  class Article
    attr_accessor :tags, :likes_count

    def initialize(options = {})
      @tags = options['tags'].map { |e|e['name'] }
      @likes_count = options['likes_count']
    end
  end
end
