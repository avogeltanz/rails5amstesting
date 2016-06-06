class VettedComment
  include HTTParty
  include ActiveModel::Model
  include ActiveModel::Serialization
  include ActiveModel::Validations
  attr_accessor :body, :tone

  def initialize(body)
    @body = body
  end

  def vet_comment
    key = MASHAPE['sentiment']['key']
    sentiment_uri = MASHAPE['sentiment']['uri']
    
    query = {'text' => body}

    headers = {}.tap do |h|
      h['X-Mashape-Key'] = key
      h['Content-Type'] = 'application/json'
      h['Accept'] = 'application/json'
    end

    res = HTTParty.post(sentiment_uri, :query => query, :headers => headers)
    self.tap do |vc|
      vc.tone = res['type']
    end
  end
end
