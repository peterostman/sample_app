FactoryGirl.define do
	factory :user do
		name					"Peter Östman"
		email					"p.ostman@me.com"
		password				"foobar"
		password_confirmation	"foobar"
	end
end