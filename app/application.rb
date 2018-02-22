class application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if @@items.include?(item_name)
        return item_name.price
      else
        resp.write "Item not found"
        resp.status = 400
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
