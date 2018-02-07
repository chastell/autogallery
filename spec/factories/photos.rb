include ActionDispatch::TestProcess

FactoryBot.define do
  factory :photo do
    image { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.jpg')) }
    title "Beautiful photo"
  end
end
