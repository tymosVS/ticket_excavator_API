class RequestHandllerController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    tiket = Tiket.new(
      request_number: params[:RequestNumber],
      sequence_number: params[:SequenceNumber].to_i,
      request_type: params[:RequestType],
      response_due_date_time: params[:DateTimes][:ResponseDueDateTime],
      primary_service_area_code: params[:ServiceArea][:PrimaryServiceAreaCode][:SACode],
      additional_service_area_codes: params[:ServiceArea][:AdditionalServiceAreaCodes][:SACode],
      dig_site_info: params[:ExcavationInfo][:DigsiteInfo][:WellKnownText]
    )

    if tiket.save
      tiket.excavator = Excavator.create(
        company_name: params[:Excavator][:CompanyName],
        address: params[:Excavator][:Address],
        sity: params[:Excavator][:City],
        state: params[:Excavator][:State],
        zip: params[:Excavator][:Zip],
        crew_on_site: params[:Excavator][:CrewOnsite] == 'true',
        # tiket: tiket
      )
    end
  end

  private

end
