class Advisor
  if(ENV['DATABASE_URL'])
    uri = URI.parse(ENV['DATABASE_URL'])
    DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
  else
    DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'mybeautyadvisors-rails_development'})
  end

  def self.allAdvisors
    results = DB.exec("SELECT * FROM advisors;")
    return results.map do |result|
      {
        "id" => result["id"].to_i,
        "name" => result["name"]
      }
    end
  end

  def self.showAdvisor(id)
    results = DB.exec("SELECT * FROM advisors WHERE id=#{id}")
    return {
      "id" => results.first["id"].to_i,
      "name" => results.first["name"]
    }
  end

  def self.createAdvisor(opts)
    results = DB.exec(
      <<-SQL
        INSERT INTO advisors (name)
        VALUES ('#{opts["name"]}')
        RETURNING id, name;
      SQL
    )
    return {
      "id" => results.first["id"].to_i,
      "name" => results.first["name"]
    }
  end

end
