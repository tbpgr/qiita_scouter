# encoding: utf-8
require 'spec_helper'
require 'models/article'

# rubocop:disable LineLength, UnusedMethodArgument
describe QiitaScouter::Article do
  context :initialize do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        init: {
          'tags' => [
            {
              'name' => 'Ruby',
              'url_name' => 'ruby',
              'versions' => []
            }
          ],
          'likes_count' => 2
        },
        expected_tags: ['Ruby'],
        expected_likes_count: 2
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          article = QiitaScouter::Article.new(c[:init])

          # -- when --
          actual_tags = article.tags
          actual_likes_count = article.likes_count

          # -- then --
          expect(actual_tags).to eq(c[:expected_tags])
          expect(actual_likes_count).to eq(c[:expected_likes_count])
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
