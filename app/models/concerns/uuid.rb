module Concerns
  module UUID
    extend ActiveSupport::Concern

    included do
      # old rails versions
      # set_primary_key 'uuid'
      self.primary_key = 'id'
      # later rails versions, untested:
      # self.primary_key = 'the_name'
      before_create :generate_uuid

      def generate_uuid
        self.id = SecureRandom.uuid
      end
    end
  end
end
