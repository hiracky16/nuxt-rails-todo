module API
  module V1
    class Groups < Grape::API
			resources :groups do
				desc 'returns all groups'
				get '/' do
					@groups = Group.all
				end
			end
    end
  end
end
