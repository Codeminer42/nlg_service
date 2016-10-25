desc "Test the Heroku endpoint"
task test_heroku: :environment do
  require "net/http"
  require "uri"

  domain = ENV['HEROKU'] || "nlg-service.herokuapp.com"
  uri = URI.parse("http://#{domain}/api/realiser")

  xml_test = File.read(Rails.root.join("test/fixtures/appositive_payload.xml"))
  response = Net::HTTP.post_form(uri, {"xml" => xml_test})

  puts "Sending this XML payload:"
  puts xml_test

  puts "Received this NLG string:"
  puts response.body
end
