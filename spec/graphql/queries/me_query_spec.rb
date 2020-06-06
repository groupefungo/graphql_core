require 'rails_helper'
RSpec.describe GraphqlCore::Queries::MeQuery do
  subject {described_class}
  context 'given an authenticated user' do
    let!(:user) {create(:user)}
    let!(:query) do
      <<-QUERY
query {
  me {
    email
  }
}
      QUERY
    end
    let!(:variables) {{}}
    let!(:context) {{current_user: user}}
    let!(:result) {schema_execute(query, variables, context, {key: 'me'})}
    it 'should return the current user context and its fields' do
      expected_hash = {
          'email' => user.email
      }

      expect_hashes_to_eq(expected_hash, result)
    end
  end
end