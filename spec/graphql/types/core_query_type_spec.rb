require 'rails_helper'

RSpec.describe GraphqlCore::Types::CoreQueryType do
  subject { described_class }
  context 'CoreQueryType' do
    it 'should contain valid queries' do
      is_expected.to have_field(:me)
      is_expected.to have_field(:node)
    end
  end
end