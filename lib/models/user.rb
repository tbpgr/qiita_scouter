module QiitaScouter
  # QiitaScouter::User
  class User
    attr_accessor :url_name, :followers, :items

    def initialize(options = {})
      @url_name = options['url_name']
      @followers = options['followers_count']
      @items = options['items_count']
    end
  end
end
