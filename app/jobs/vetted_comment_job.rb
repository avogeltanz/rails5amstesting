class VettedCommentJob < ApplicationJob
  queue_as :default

  def perform(comment)
    vetted_comment = VettedComment.new(comment.body).vet_comment

    comment.update_attribute(:tone, vetted_comment.tone)
  end
end
