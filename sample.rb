require "sinatra"
require "http"

def get_response_from_remote_host
  @thanks = HTTP.get("#{ENV['REMOTE_HOST'] || 'http://localhost:9394'}/responses/#{params[:response_id]}").parse
end

def show_thankyou_page
  erb :thanks
end

def show_index_page
  erb :index
end

get "/thanks/:response_id" do
  get_response_from_remote_host
  show_thankyou_page
end

get "/" do
  show_index_page
end