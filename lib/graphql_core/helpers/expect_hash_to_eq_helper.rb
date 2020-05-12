module GraphqlCore
  module ExpectHashToEqHelper
    def expect_hashes_to_eq(expected, result)
      if expected.is_a? Array
        expected.each_with_index do |expect, index|
          expect.each do |key, value|
            if value.is_a?(Hash)
              expect_hashes_to_eq(value, result[index][key.to_s])
            else
              if result[index][key.to_s].is_a? Integer
                expect(result[index][key.to_s].to_s).to eq(value)
              else
                expect(result[index][key.to_s]).to eq(value)
              end
            end
          end
        end
      else
        expected.each do |key, value|
          if value.is_a?(Hash)
            expect_hashes_to_eq(value, result[key.to_s])
          else
            expect(result[key.to_s]).to eq(value)
          end
        end
      end
    end
  end
end