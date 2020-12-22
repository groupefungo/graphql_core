module GraphqlCore
  module ExpectHashToEqHelper
    def expect_hashes_to_eq(expected, result)
      if expected.is_a?(Array)
        expect_array_to_eq(expected, result)
      else
        expected.each do |key, value|
          if value.is_a?(Hash)
            expect_hashes_to_eq(value, result[key])
          elsif value.is_a?(Array)
            expect_array_to_eq(value, result[key])
          else
            pp key
            expect(result[key]).to eq(value)
          end
        end
      end
    end

    def expect_array_to_eq(expected, result)
      expected.each_with_index do |expect, index|
        if expect.is_a?(Hash)
          expect.each do |key, value|
            if value.is_a?(Hash)
              expect_hashes_to_eq(value, result[index][key])
            else
              pp key
              expect(result[index][key]).to eq(value)
            end
          end
        else
          expect(expect).to eq(result[index])
        end
      end
    end
  end
end