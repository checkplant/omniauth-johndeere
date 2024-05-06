require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Johndeere < OmniAuth::Strategies::OAuth2
      option :name, 'johndeere'

      option :client_options, {
        site: 'https://signin.johndeere.com/oauth2',
        authorize_url: 'https://signin.johndeere.com/oauth2/aus78tnlaysMraFhC1t7/v1/authorize',
        token_url: 'https://signin.johndeere.com/oauth2/aus78tnlaysMraFhC1t7/v1/token'
      }

      def raw_info
        @raw_info ||= access_token.params["user"]
      end
    end
  end
end
