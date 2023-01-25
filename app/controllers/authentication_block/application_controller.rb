module AuthenticationBlock
    class ApplicationController < ActionController::API
        def encode_token(payload)
            JWT.encode(payload,'secret9')
        end

        def decode_token
            auth_header = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiNyJ9.3pVh8wrqIQFwFX6dQBTJixG_2Cyn17YFeS3YMVQpc5E'#request.headers['Authorization']
            if auth_header
                token = auth_header.split(' ')[1]
                begin
                    JWT.decode(token,'secret9',true,algorithm: 'HS256')
                rescue JWT::DecodeError
                    nil
                end
            end
        end
    end
  end