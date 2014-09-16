require 'models/article'

module QiitaScouter
  # QiitaScouter::Articles
  class Articles
    include Enumerable
    attr_accessor :articles

    def initialize(articles = [])
      @articles = articles
    end

    def <<(article)
      @articles << article
    end

    def +(other)
      @articles += other.articles
      self
    end

    def size
      @articles.size
    end

    def each
      @articles.each { |article|yield(article) }
    end
  end
end
