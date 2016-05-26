class VettedCommentJob < ApplicationJob
  queue_as :default

  def perform(comment)
    vetted_comment = VettedComment.vet_comment(comment.body)

    comment.update_attribute(:tone, vetted_comment.tone)
  end
end
