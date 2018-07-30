require "sinatra"
require "http"

get "/thanks/:response_id" do
  @thanks = HTTP.get("http://localhost:9394/responses/#{params[:response_id]}").parse
  erb :thanks
end

get "/" do
  erb :index
end