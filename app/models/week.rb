class Week
  if(ENV['DATABASE_URL'])
    uri = URI.parse(ENV['DATABASE_URL'])
    DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
  else
    DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'mybeautyadvisors-rails_development'})
  end

  def self.allWeeks(advisorId)
    results = DB.exec("SELECT * FROM weeks WHERE belongs_to_advisor=#{advisorId};")
    return results.map do |result|
      {
        "id" => result["id"].to_i,
        "belongs_to_advisor" => result["belongs_to_advisor"].to_i,
        "date" => result["date"],
        "act_upt" => result["act_upt"].to_f,
        "goal_upt" => result["goal_upt"].to_f,
        "act_atv" => result["act_atv"].to_f,
        "goal_atv" => result["goal_atv"].to_f,
        "act_sbr" => result["act_sbr"].to_f,
        "goal_sbr" => result["goal_sbr"].to_f,
        "act_total" => result["act_total"].to_f,
        "goal_total" => result["goal_total"].to_f
      }
    end
  end

  def self.showWeek(advisorId, id)
    results = DB.exec("SELECT * FROM weeks WHERE belongs_to_advisor=#{advisorId} AND id=#{id};")
    return {
      "id" => results.first["id"].to_i,
      "belongs_to_advisor" => results.first["belongs_to_advisor"].to_i,
      "date" => results.first["date"],
      "act_upt" => results.first["act_upt"].to_f,
      "goal_upt" => results.first["goal_upt"].to_f,
      "act_atv" => results.first["act_atv"].to_f,
      "goal_atv" => results.first["goal_atv"].to_f,
      "act_sbr" => results.first["act_sbr"].to_f,
      "goal_sbr" => results.first["goal_sbr"].to_f,
      "act_total" => results.first["act_total"].to_f,
      "goal_total" => results.first["goal_total"].to_f
    }
  end

  def self.createWeek(opts)
    results = DB.exec(
      <<-SQL
        INSERT INTO weeks (belongs_to_advisor, date, act_upt, goal_upt, act_atv, goal_atv, act_sbr, goal_sbr, act_total, goal_total)
        VALUES (#{opts["belongs_to_advisor"]}, '#{opts["date"]}', '#{opts["act_upt"]}', '#{opts["goal_upt"]}', '#{opts["act_atv"]}', '#{opts["goal_atv"]}', '#{opts["act_sbr"]}', '#{opts["goal_sbr"]}', '#{opts["act_total"]}', '#{opts["goal_total"]}')
        RETURNING id, belongs_to_advisor, date, act_upt, goal_upt, act_atv, goal_atv, act_sbr, goal_sbr, act_total, goal_total;
      SQL
    )
    return {
      "id" => results.first["id"].to_i,
      "belongs_to_advisor" => results.first["belongs_to_advisor"].to_i,
      "date" => results.first["date"],
      "act_upt" => results.first["act_upt"].to_f,
      "goal_upt" => results.first["goal_upt"].to_f,
      "act_atv" => results.first["act_atv"].to_f,
      "goal_atv" => results.first["goal_atv"].to_f,
      "act_sbr" => results.first["act_sbr"].to_f,
      "goal_sbr" => results.first["goal_sbr"].to_f,
      "act_total" => results.first["act_total"].to_f,
      "goal_total" => results.first["goal_total"].to_f
    }
  end

  def self.deleteWeek(id)
    results = DB.exec("DELETE FROM weeks WHERE id=#{id};")
    return {"deleted" => true}
  end

end
