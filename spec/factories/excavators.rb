FactoryBot.define do
  factory :excavator do
    company_name { 'John Doe CONSTRUCTION' }
      address { '555 Some RD' }
      city { 'SOME PARK' }
      state { 'ZZ' }
      zip { '55555' }
      crew_on_site { true }
      tiket { create(:tiket) }
  end
end
