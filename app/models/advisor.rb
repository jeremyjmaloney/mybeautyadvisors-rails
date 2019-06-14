class Advisor
  if(ENV['DATABASE_URL'])
    uri = URI.parse(ENV['DATABASE_URL'])
    DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
  else
    DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'mybeautyadvisors-rails_development'})
  end

  def self.allAdvisors(storeNum)
    results = DB.exec("SELECT * FROM advisors WHERE belongs_to_store=#{storeNum};")
    return results.map do |result|
      {
        "id" => result["id"].to_i,
        "belongs_to_store" => result["belongs_to_store"].to_i,
        "name" => result["name"]
      }
    end
  end

  def self.showAdvisor(storeNum, id)
    results = DB.exec("SELECT * FROM advisors WHERE belongs_to_store=#{storeNum} AND id=#{id}")
    return {
      "id" => results.first["id"].to_i,
      "belongs_to_store" => results.first["belongs_to_store"].to_i,
      "name" => results.first["name"]
    }
  end

  def self.createAdvisor(opts)
    results = DB.exec(
      <<-SQL
        INSERT INTO advisors (belongs_to_store, name)
        VALUES (#{opts["belongs_to_store"]}, '#{opts["name"]}')
        RETURNING id, belongs_to_store, name;
      SQL
    )
    return {
      "id" => results.first["id"].to_i,
      "belongs_to_store" => results.first["belongs_to_store"].to_i,
      "name" => results.first["name"]
    }
  end

  def self.deleteAdvisor(id)
    results = DB.exec("DELETE FROM advisors WHERE id=#{id};")
    return {"deleted" => true}
  end

end
