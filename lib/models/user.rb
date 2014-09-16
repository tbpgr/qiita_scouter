module QiitaScouter
  # QiitaScouter::User
  class User
    attr_accessor :url_name, :followers, :items

    def initialize(options = {})
      @url_name = options['url_name']
      @followers = options['followers']
      @items = options['items']
    end
  end
end
