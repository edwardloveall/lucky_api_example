class Home::Index < ApiAction
  get "/" do
    json({hello: "Hello World"})
  end
end
