# frozen_string_literal: true

# controller for handle requests and create Tiket and Excavator
class RequestHandllerController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    head 422 and return unless check_tiket?
    register_tiket
    head 422 and return unless @tiket.save
    register_excavator
    head 422 and @tiket.destroy unless @excavator.save
  end

  private

  def register_tiket
    @tiket = Tiket.new(
      request_number: params[:RequestNumber],
      sequence_number: params[:SequenceNumber].to_i,
      request_type: params[:RequestType],
      response_due_date_time: params[:DateTimes][:ResponseDueDateTime],
      primary_service_area_code: params[:ServiceArea][:PrimaryServiceAreaCode][:SACode],
      additional_service_area_codes: params[:ServiceArea][:AdditionalServiceAreaCodes][:SACode],
      dig_site_info: params[:ExcavationInfo][:DigsiteInfo][:WellKnownText]
    )
  end

  def register_excavator
    @excavator = Excavator.new(
      company_name: params[:Excavator][:CompanyName],
      address: params[:Excavator][:Address],
      city: params[:Excavator][:City],
      state: params[:Excavator][:State],
      zip: params[:Excavator][:Zip],
      crew_on_site: params[:Excavator][:CrewOnsite] == 'true',
      tiket: @tiket
    )
  end

  def check_tiket?
    params[:DateTimes] != nil &&
    params[:ServiceArea] != nil &&
    params[:ServiceArea][:PrimaryServiceAreaCode] != nil &&
    params[:ServiceArea][:AdditionalServiceAreaCodes] != nil &&
    params[:ExcavationInfo] != nil &&
    params[:ExcavationInfo][:DigsiteInfo] != nil
  end
end
