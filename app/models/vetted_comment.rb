class VettedComment
  include HTTParty
  include ActiveModel::Model
  include ActiveModel::Serialization
  include ActiveModel::Validations
  attr_accessor :body, :tone

  def self.vet_comment(body)
    key = MASHAPE['sentiment']['key']
    sentiment_uri = MASHAPE['sentiment']['uri']
    
    query = {'text' => body}

    headers = {}.tap do |h|
      h['X-Mashape-Key'] = key
      h['Content-Type'] = 'application/json'
      h['Accept'] = 'application/json'
    end

    res = HTTParty.post(sentiment_uri, :query => query, :headers => headers)
    self.new(body: body, tone: res['type'])
  end
end
