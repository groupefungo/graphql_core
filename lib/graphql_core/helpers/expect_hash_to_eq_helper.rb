module GraphqlCore
  module ExpectHashToEqHelper
    def expect_hashes_to_eq(expected, result)
      expected.each do |key, value|
        if value.is_a?(Hash)
          expect_hashes_to_eq(value, result[key])
        elsif value.is_a?(Array)
          expect_array_to_eq(value, result[key])
        else
          expect(result[key]).to eq(value)
        end
      end
    end

    def expect_array_to_eq(expected, result)
      expected.each_with_index do |expect, index|
        expect.each do |key, value|
          if value.is_a?(Hash)
            expect_hashes_to_eq(value, result[index][key])
          else
            expect(result[index][key]).to eq(value)
          end
        end
      end
    end
  end
end