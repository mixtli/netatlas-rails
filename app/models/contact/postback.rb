class Contact::Postback < Contact
  validates :url, :presence => true

  def send_notification(event)
    uri = URI.parse(url)
    response = connection.post "#{uri.path}?#{uri.query}" do |req|
      req.headers['Content-Type'] = "application/json"
      req.body = event.to_json
    end
    unless response.status == 200
      raise "Unable to send postback to #{url}"
    end
    true
  end

  def to_s
    url
  end

  private
  def connection
    uri = URI.parse(url)
    @connection ||= Faraday.new("#{uri.scheme}://#{uri.host}:#{uri.port}") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
