require 'rails_helper'

RSpec.describe Tiket, type: :model do
  context 'Fields' do
    %i[
      request_number
      sequence_number
      request_type
      response_due_date_time
      primary_service_area_code
      additional_service_area_codes
      dig_site_info
      created_at
      updated_at
    ].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end

  context 'Type fields' do
    %i[
      request_number
      request_type
      primary_service_area_code
      additional_service_area_codes
    ].each do |field|
      it { is_expected.to have_db_column(field).of_type(:string) }
    end

    %i[
      response_due_date_time
      created_at
      updated_at
    ].each do |field|
      it { is_expected.to have_db_column(field).of_type(:datetime) }
    end

    %i[
      dig_site_info
    ].each do |field|
      it { is_expected.to have_db_column(field).of_type(:text) }
    end

    %i[
      sequence_number
    ].each do |field|
      it { is_expected.to have_db_column(field).of_type(:integer) }
    end
  end

  context 'Associations' do
    %i[excavator].each do |association|
      it { is_expected.to have_one(association) }
    end
  end

  context 'Validations' do
    context 'Presence fields' do
      %i[
        request_number
        sequence_number
        request_type
        response_due_date_time
        primary_service_area_code
        additional_service_area_codes
        dig_site_info
      ].each do |field|
        it { is_expected.to validate_presence_of(field) }
      end
    end

    it "is not valid with empty attributes" do
      expect(Tiket.new).to_not be_valid
    end
  end
end

