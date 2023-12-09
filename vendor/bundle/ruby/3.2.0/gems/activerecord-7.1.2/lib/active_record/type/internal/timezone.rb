# frozen_string_literal: true

module ActiveRecord
  module Type
    module Internal
      module Timezone
        def initialize(timezone: nil, **kwargs)
          super(**kwargs)
          @timezone = timezone
        end

        def is_utc?
          default_timezone == :utc
        end

        def default_timezone
          @timezone || ActiveRecord.default_timezone
        end
      end
    end
  end
end
