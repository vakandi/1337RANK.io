require "json"
require "net/http"

USER_ID= "u-s4t2ud-4e64ea992c23df75de2bbd80293f51aa0ac0a84ea354af2c1072c856e5829b7b"
USER_SECRET= "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"
BASE_URL = "https://api.intra.42.fr"

def return_token
  uri = URI("#{BASE_URL}/oauth/token")
  response = Net::HTTP.post_form(uri, {
    "grant_type" => "client_credentials",
    "client_id" => USER_ID,
    "client_secret" => USER_SECRET,
  })
  data = JSON.parse(response.body)
  data["access_token"]
end

def fetch_users(token, page)
  uri = URI("#{BASE_URL}/v2/cursus_users")
  params = {
    "access_token" => token,
    "filter[campus_id]" => 55,
    "page[size]" => 100,
    "page[number]" => page,
  }
  uri.query = URI.encode_www_form(params)
  response = Net::HTTP.get_response(uri)
  JSON.parse(response.body)
end


def coordination
  token = return_token
  users = fetch_users(token, 1)
  sleep(0.5)
  users += fetch_users(token, 2)
  sleep(0.5)
  users += fetch_users(token, 3)
  users = users.sort_by { |k| k["created_at"] }.reverse
  pats = users[0...204]
  pats = pats.sort_by { |k| k["level"] }.reverse
  pats.each.with_index(1) do |user, idx|
    next if user["user"]["login"] == "testinggg" || user["user"]["login"] == "hamza"
    puts "#{idx - 2}  #{user["user"]["login"]} #{user["level"]}    " if idx <= 204
  end
end


coordination

