module Stockers
  module ContextAccessor
    def context
      Thread.current[:context]
    end
  end
end
