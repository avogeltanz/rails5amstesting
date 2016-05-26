class Comment < ApplicationRecord
  include Concerns::UUID
  include Pipeable

  validates_presence_of :body
  after_save :vet_comment

  def vet_comment
    # http://edgeapi.rubyonrails.org/classes/ActiveJob/QueueAdapters/AsyncAdapter.html
    # The default adapter performs asynchonously
    VettedCommentJob.perform_later(self)
  end
end
