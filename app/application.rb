class application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
  
end