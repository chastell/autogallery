include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :photo do
    image { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.jpg')) }
    title "Beautiful photo"
  end
end
