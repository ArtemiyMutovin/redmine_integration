require 'faraday'
require 'dotenv'
Dotenv.load

class BrightSoft

  def initialize
    @client = Faraday.new(
      url: ENV["BRIGHT_SOFT_URL"],
      headers: {'Content-Type' => 'application/json'}
    ) do |faraday|
      faraday.request :authorization, :basic, ENV["BRIGHT_SOFT_LOGIN"], ENV["BRIGHT_SOFT_PASSWORD"]
      faraday.response :json
    end
  end

  def create_issue
    response = @client.post('/issues.json') do |req|
      req.body = File.read('attributes_examples/create_attributes.json')
    end
    @issue_id = response.body["issue"]["id"]
    response.status
  end

  def update_issue
    response = @client.put("/issues/#{@issue_id}.json") do |req|
      req.body = File.read('attributes_examples/update_attributes.json')
    end
    response.status
  end

  def delete_issue
    response = @client.delete("/issues/#{@issue_id}.json")
    response.status
  end
end
