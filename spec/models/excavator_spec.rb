require 'rails_helper'

RSpec.describe Excavator, type: :model do
  context 'Fields' do
    %i[
      company_name
      address
      sity
      state
      zip
      crew_on_site
      tiket_id
      created_at
      updated_at
    ].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end

  context 'Type fields' do
    %i[
      company_name
      address
      sity
      state
      zip
    ].each do |field|
      it { is_expected.to have_db_column(field).of_type(:string) }
    end

    %i[
      crew_on_site
    ].each do |field|
      it { is_expected.to have_db_column(field).of_type(:boolean) }
    end

    %i[
      tiket_id
    ].each do |field|
      it { is_expected.to have_db_column(field).of_type(:integer) }
    end

    %i[
      created_at
      updated_at
    ].each do |field|
      it { is_expected.to have_db_column(field).of_type(:datetime) }
    end


  end
end
