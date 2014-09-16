require 'open-uri'
require 'openssl'
require 'json'
require 'models/user'

module QiitaScouter
  # QiitaScouter::QiitaUserJsonLoader
  class QiitaUserJsonLoader
    attr_reader :target_user, :user
    QIITA_URL = 'https://qiita.com/api/v1/users/%s'

    def load(target_user)
      @target_user = target_user
      tmp_verbose = $VERBOSE
      $VERBOSE = nil
      OpenSSL::SSL.const_set('VERIFY_PEER', OpenSSL::SSL::VERIFY_NONE)
      $VERBOSE = tmp_verbose
      load_page
    end

    private

    def load_page
      json = open(format(QIITA_URL, @target_user)).read
      user = JSON.parser.new(json).parse
      @user = User.new(user)
    end
  end
end
