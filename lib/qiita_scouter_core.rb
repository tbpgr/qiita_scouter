# encoding: utf-8
require 'models/article'
require 'models/articles'
require 'models/user'
require 'qiita_user_json_loader'
require 'qiita_items_json_loader'
require 'qiita_scouter_calculator'

module QiitaScouter
  #  QiitaScouter Core
  class Core
    # Generate QiitaScouter markdown file.
    def analyze(target_user)
      user = read_user(target_user)
      articles = read_articles(target_user)
      calc_power_levels(user, articles)
    end

    private

    def read_user(target_user)
      user_loader = QiitaUserJsonLoader.new
      user_loader.load(target_user)
      user_loader.user
    end

    def read_articles(target_user)
      articles_loader = QiitaItemsJsonLoader.new
      articles_loader.load(target_user)
      articles_loader.articles
    end

    def calc_power_levels(user, articles)
      calc = QiitaScouter::Calculator.new(user, articles)
      [
        calc.calc_power_level,
        calc.calc_strength,
        calc.calc_intelligence,
        calc.calc_quickness
      ]
    end
  end
end
