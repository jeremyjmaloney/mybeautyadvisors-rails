class Store
  if(ENV['DATABASE_URL'])
    uri = URI.parse(ENV['DATABASE_URL'])
    DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
  else
    DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'mybeautyadvisors-rails_development'})
  end

  def self.allStores
    results = DB.exec("SELECT * FROM stores;")
    return results.map do |result|
      {
        "id" => result["id"].to_i,
        "store_number" => result["store_number"].to_i,
        "store_name" => result["store_name"],
        "manager_name" => result["manager_name"]
      }
    end
  end

  def self.showStore(id)
    results = DB.exec("SELECT * FROM stores WHERE id=#{id}")
    return {
      "id" => results.first["id"].to_i,
      "store_number" => results.first["store_number"].to_i,
      "store_name" => results.first["store_name"],
      "manager_name" => results.first["manager_name"]
    }
  end

  def self.createStore(opts)
    results = DB.exec(
      <<-SQL
        INSERT INTO stores (store_number, store_name, manager_name)
        VALUES (#{opts["store_number"]}, '#{opts["store_name"]}', '#{opts["manager_name"]}')
        RETURNING id, store_number, store_name, manager_name;
      SQL
    )
    return {
      "id" => results.first["id"].to_i,
      "store_number" => results.first["store_number"].to_i,
      "store_name" => results.first["store_name"],
      "manager_name" => results.first["manager_name"]
    }
  end

  def self.deleteStore(id)
    results = DB.exec("DELETE FROM stores WHERE id=#{id};")
    return {"deleted" => true}
  end

end
