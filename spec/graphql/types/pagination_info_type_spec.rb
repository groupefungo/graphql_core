require 'rails_helper'

RSpec.describe GraphqlCore::Types::PaginationInfoType do
  subject { described_class }
  context 'PaginationInfoType' do
    it 'should contain valid types' do
      is_expected.to have_field(:has_next_page).of_type('Boolean!')
      is_expected.to have_field(:has_previous_page).of_type('Boolean!')
      is_expected.to have_field(:start_cursor).of_type('String')
      is_expected.to have_field(:end_cursor).of_type('String')
      is_expected.to have_field(:pages_count).of_type('Int!')
      is_expected.to have_field(:remaining).of_type('Int!')
      is_expected.to have_field(:total).of_type('Int!')
    end
  end
end