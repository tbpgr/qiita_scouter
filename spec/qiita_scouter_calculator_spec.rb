# encoding: utf-8
require 'spec_helper'
require 'qiita_scouter_calculator'
require 'models/user'
require 'models/article'
require 'models/articles'

# rubocop:disable LineLength, UnusedMethodArgument
describe QiitaScouter::Calculator do
  user = QiitaScouter::User.new(
                                  'url_name' => 'tbpgr',
                                  'followers_count' => 10,
                                  'items_count' => 20
                                )
  articles = QiitaScouter::Articles.new([
    QiitaScouter::Article.new(
                                'tags' => [
                                  { 'name' => 'Ruby' },
                                  { 'name' => 'Graphviz' }
                                ],
                                'likes_count' => 25
                              ),
    QiitaScouter::Article.new(
                                'tags' => [
                                  { 'name' => 'PHP' },
                                  { 'name' => 'Graphviz' }
                                ],
                                'likes_count' => 32
                              )
  ])

  context :calc_strength do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        user: user,
        articles: articles,
        expected: 10 * 10 * (50 / 10)
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          qiita_scouter_calculator = QiitaScouter::Calculator.new(c[:user], c[:articles])

          # -- when --
          actual = qiita_scouter_calculator.calc_strength

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end

  context :calc_intelligence do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        user: user,
        articles: articles,
        expected: 20 * 5 * (50 / 10)
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          qiita_scouter_calculator = QiitaScouter::Calculator.new(c[:user], c[:articles])

          # -- when --
          actual = qiita_scouter_calculator.calc_intelligence

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end

  context :calc_quickness do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        user: user,
        articles: articles,
        expected: 3 * (50 / 10)
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          qiita_scouter_calculator = QiitaScouter::Calculator.new(c[:user], c[:articles])

          # -- when --
          actual = qiita_scouter_calculator.calc_quickness

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end

  context :calc_power_level do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        user: user,
        articles: articles,
        expected: (10 * 10 * (50 / 10)) + (20 * 5 * (50 / 10)) + (3 * (50 / 10))
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          qiita_scouter_calculator = QiitaScouter::Calculator.new(c[:user], c[:articles])

          # -- when --
          actual = qiita_scouter_calculator.calc_power_level

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end
end
# rubocop:enable LineLength, UnusedMethodArgument
