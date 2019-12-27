FactoryBot.define do
  factory :tiket do
    request_number { '123-123' }
    sequence_number { '123' }
    request_type { 'normal' }
    response_due_date_time { '2011/07/02 23:09:38' }
    primary_service_area_code { 'ZZGL103' }
    additional_service_area_codes { ['ZZL01', 'ZZL02', 'ZZL03'] }
    dig_site_info { 'POLYGON((-81.13390268058475 32.07206917625161))' }
  end
end
