# encoding: utf-8
require 'models/user'
require 'models/article'
require 'models/articles'

module QiitaScouter
  #  QiitaScouter Core
  class Calculator
    def initialize(user, articles)
      @url_name = user.url_name
      @followers = user.followers
      @items = user.items
      @tags = articles.reduce([]) { |a, e|a += e.tags; a }.uniq.size
      stock_count = articles.map(&:stock_count).reduce(&:+)
      @stock_rate = stock_count / 10
    end

    # 攻撃力を計算
    # フォロワー数 × 10 × (ストック数/10)
    def calc_strength
      @followers * 10 * @stock_rate
    end

    # 知力を計算
    # 記事数 × 5 × (ストック数/10)
    def calc_intelligence
      @items * 5 * @stock_rate
    end

    # すばやさを計算
    # Tag数 × (ストック数/10)
    def calc_quickness
      @tags * @stock_rate
    end

    # 戦闘力を計算
    # 攻撃力、 知力、 すばやさの合計
    def calc_power_level
      [calc_strength, calc_intelligence, calc_quickness].reduce(&:+)
    end
  end
end
