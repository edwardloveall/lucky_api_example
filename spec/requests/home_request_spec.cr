require "../spec_helper"

include ContextHelper

describe "Home" do
  it "returns a json response" do
    response = Home::Index.new(build_context, params).call

    JSON.parse(response.body).should eq({"hello" => "Hello World"})
  end
end
