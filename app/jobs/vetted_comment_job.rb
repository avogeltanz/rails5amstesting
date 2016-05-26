class VettedCommentJob < ApplicationJob
  queue_as :default

  def perform(id, body)
    vetted_comment = VettedComment.vet_comment(body)

    comment = Comment.find(id)
    comment.tone = vetted_comment.tone
    comment.save
  end
end
