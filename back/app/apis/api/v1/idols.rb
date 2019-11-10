module API
  module V1
    class Idols < Grape::API
			resources :idols do
				desc 'returns all idols'
				get '/' do
					@idols = Idol.all
				end
			end
    end
  end
end
