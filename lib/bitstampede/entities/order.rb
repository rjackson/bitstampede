require_relative './base'

module Bitstampede
  module Entities
    class Order < Base
      def self.map_type
        ->(val) do
          case val.to_s
          when '0'
            :buy
          when '1'
            :sell
          else
            raise 'No such type'
          end
        end
      end

      def self.mappings
        {
          id: map_int,
          datetime: map_int,
          type: map_type,
          price: map_decimal,
          amount: map_decimal
        }
      end

      setup_readers
    end
  end
end
