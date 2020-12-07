require 'rails_helper'
RSpec.describe 'GraphqlCore::Queries::GlobalIdNodeQuery' do
  subject {described_class}
  context 'given an authenticated user' do
    let!(:user) {create(:user)}
    let!(:query) do
      <<-QUERY
query($gid: ID) {
  node(gid: $gid) {
    email
  }
}
      QUERY
    end
    let!(:variables) {{gid: user.to_gid_param}}
    let!(:context) {{current_user: user}}
    let!(:result) {schema_execute(query, variables, context, {key: 'node'})}

    it 'should return the current a user given a valid gid' do
      expected_hash = {
          'email' => user.email
      }

      expect_hashes_to_eq(expected_hash, result)
    end
  end
end