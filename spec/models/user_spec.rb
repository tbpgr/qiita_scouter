# encoding: utf-8
require 'spec_helper'
require 'models/user'

# rubocop:disable LineLength, UnusedMethodArgument
describe QiitaScouter::User do
  context :initialize do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        init: {
          'url_name' => 'tbpgr',
          'followers' => 10,
          'items' => 20
        },
        expected_url_name: 'tbpgr',
        expected_followers: 10,
        expected_items: 20
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          article = QiitaScouter::User.new(c[:init])

          # -- when --
          actual_url_name = article.url_name
          actual_followers = article.followers
          actual_items = article.items

          # -- then --
          expect(actual_url_name).to eq(c[:expected_url_name])
          expect(actual_followers).to eq(c[:expected_followers])
          expect(actual_items).to eq(c[:expected_items])
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
