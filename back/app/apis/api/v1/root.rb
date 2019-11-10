module API
  module V1
    class Root < Grape::API

      # これでdomain/api/v1でアクセス出来るようになる。
      version 'v1', using: :path
      format :json

      mount API::V1::Idols
      mount API::V1::Groups

      # 404NotFoundの扱い
      route :any, '*path' do
        error! I18n.t('grape.errors.not_found'), 404
      end

    end
  end
end
