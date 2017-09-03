# encoding: utf-8
require 'spec_helper'
require 'qiita_user_json_loader'
require 'json'
require 'open-uri'
require 'openssl'
require 'models/user'

describe QiitaScouter::QiitaUserJsonLoader do
  context :load do
    cases = [
      {
        case_no: 1,
        case_title: 'valid case',
        user: 'user',
        expected_url_name: 'tbpgr',
        expected_followers: 14,
        expected_items: 226
      }
    ]

    # Dummy
    class Dummy
      def read
        <<-EOS
{"id":43480,
"url_name":"tbpgr",
"followers_count":14,
"items_count":226
}
        EOS
      end
    end

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          qiita_json_loader = QiitaScouter::QiitaUserJsonLoader.new
          qiita_json_loader.stub(:open).and_return(Dummy.new)

          # -- when --
          qiita_json_loader.load(c[:user])
          actual_user = qiita_json_loader.user

          # -- then --
          expect(actual_user.url_name).to eq(c[:expected_url_name])
          expect(actual_user.followers).to eq(c[:expected_followers])
          expect(actual_user.items).to eq(c[:expected_items])
        ensure
          case_after c
        end
      end

      def case_before(c) # rubocop:disable UnusedMethodArgument
        # implement each case before
      end

      def case_after(c) # rubocop:disable UnusedMethodArgument
        # implement each case after
      end
    end
  end
end
