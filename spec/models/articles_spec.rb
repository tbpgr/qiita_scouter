# encoding: utf-8
require 'spec_helper'
require 'models/article'
require 'models/articles'

# rubocop:disable LineLength, UnusedMethodArgument
describe QiitaScouter::Articles do
  context :<< do
    cases = [
      {
        case_no: 1,
        case_title: '2 list case',
        appends: [
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'Ruby' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 25
                                    ),
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'Ruby' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 25
                                    )
        ],
        expected: 2
      },
      {
        case_no: 2,
        case_title: '1 list case',
        appends: [
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'Ruby' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 25
                                    )
        ],
        expected: 1
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          qiita_scouter_articles = QiitaScouter::Articles.new

          # -- when --
          c[:appends].each { |e|qiita_scouter_articles << e }
          actual = qiita_scouter_articles.size

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

  context :+ do
    cases = [
      {
        case_no: 1,
        case_title: 'init 0 append 2 list case',
        init: [],
        appends:  QiitaScouter::Articles.new([
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'Ruby' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 25
                                    ),
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'PHP' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 32
                                    )
        ]),
        expected: 2
      },
      {
        case_no: 2,
        case_title: 'init 2 append 2 list case',
        init: [
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'Ruby' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 25
                                    ),
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'Ruby' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 25
                                    )
        ],
        appends: QiitaScouter::Articles.new([
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'Ruby' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 25
                                    ),
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'PHP' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 32
                                    )
        ]),
        expected: 4
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          qiita_scouter_articles = QiitaScouter::Articles.new(c[:init])

          # -- when --
          qiita_scouter_articles += c[:appends]
          actual = qiita_scouter_articles.size

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

  context :size do
    cases = [
      {
        case_no: 1,
        case_title: '2 list case',
        articles: [
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'Ruby' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 25
                                    ),
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'Ruby' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 25
                                    )
        ],
        expected: 2
      },
      {
        case_no: 2,
        case_title: 'empty list case',
        articles: [],
        expected: 0
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          qiita_scouter_articles = QiitaScouter::Articles.new(c[:articles])

          # -- when --
          actual = qiita_scouter_articles.size

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

  context :each do
    cases = [
      {
        case_no: 1,
        case_title: '2 list case',
        articles: [
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'Ruby' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 1
                                    ),
          QiitaScouter::Article.new(
                                      'tags' => [
                                        { 'name' => 'Ruby' },
                                        { 'name' => 'Graphviz' }
                                      ],
                                      'stock_count' => 2
                                    )
        ],
        expected: 3
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          qiita_scouter_articles = QiitaScouter::Articles.new(c[:articles])

          # -- when --
          total = 0
          qiita_scouter_articles.each { |e|total += e.stock_count }

          # -- then --
          expect(total).to eq(c[:expected])
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
