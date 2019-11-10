FactoryBot.define do
	factory :group, class: Group do
		name { "gruop" }

		trait :with_idol do
			after(:build) do |group|
				group.idols << FactoryBot.build(:idol, name: "idol")
			end
		end
	end 
end
