require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Johndeere < OmniAuth::Strategies::OAuth2
      option :name, 'johndeere'
      # option :authorize_options, []

      option :client_options, {
        site: 'https://signin.johndeere.com/oauth2',
        authorize_url: 'https://signin.johndeere.com/oauth2/aus78tnlaysMraFhC1t7/v1/authorize',
        token_url: 'https://signin.johndeere.com/oauth2/aus78tnlaysMraFhC1t7/v1/token'
      }

      # uid { raw_info['uuid'] }

      # info do
      #   {
      #     first_name: raw_info['firstname'],
      #     last_name: raw_info['lastname'],
      #     email: raw_info['email']
      #   }
      # end

      # extra do
      #   {
      #     raw_info: raw_info
      #   }
      # end


      # def authorize_params
      #   super.tap do |params|
      #     %w[custom].each do |v|
      #       if request.params[v]
      #         params[v.to_sym] = request.params[v]
      #       end
      #     end

      #     params[:robson] = "robtest"
      #   end
      # end

      def authorize_params
        puts "================================================"
        puts "authorize_params com scope param"
        super.tap do |params|
          # options[:authorize_options].each do |key|
          #   params[key.to_sym] = request.params[key.to_s] if request.params[key.to_s]
          # end

          # puts ">>>>>>>>>>>>> request.params >>>>>>>>>>>>"
          # puts request.params
          # byebug
          # puts ">>>>>>>>>>>>> request.params >>>>>>>>>>>>"

          # puts 
          # %w[scope].each do |key|
          #   params[key.to_sym] = request.params[key.to_s] if request.params[key.to_s]
          # end

          # Codificar os dados adicionais em base64
          encoded_state = Base64.urlsafe_encode64(additional_data.to_json)

          byebug
          puts ">>>>>>>>>>>>> authorize_params >>>>>>>>>>>>"
          puts encoded_state
          puts ">>>>>>>>>>>>> authorize_params >>>>>>>>>>>>"
          params[:state] = encoded_state
        end
      end

      # def secure_state
      #   @state ||= session['omniauth.state'] = SecureRandom.hex(24)
      # end

      def raw_info
        @raw_info ||= access_token.params["user"]
      end
    end
  end
end
