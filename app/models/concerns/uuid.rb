module Concerns
  module UUID
    extend ActiveSupport::Concern

    included do
      self.primary_key = 'id'
      before_create :generate_uuid

      def generate_uuid
        self.id = SecureRandom.uuid
      end
    end
  end
end
