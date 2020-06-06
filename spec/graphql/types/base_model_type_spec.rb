require 'rails_helper'

RSpec.describe GraphqlCore::Types::BaseModelType do
  subject { described_class }
  context 'BaseModelType' do
    it 'should contain valid queries' do
      is_expected.to implement('NodeInterface')
    end
  end
end