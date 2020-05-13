require 'pry'
# bachelor = {
#   "season 30": [
#     {
#       "name":      "Beth Smalls",
#       "age":       "26",
#       "hometown":  "Great Falls, Virginia",
#       "occupation":"Nanny/Freelance Journalist",
#       "status":    "Winner"
#     },
#     {
#       "name":       "Becca Tilley",
#       "age":        "27",
#       "hometown":   "Shreveport, Louisiana",
#       "occupation": "Chiropractic Assistant",
#       "status":     "Eliminated Week 8"
#     }
#   ],
#   "season 29": [
#     {
#       "name":      "Ashley Yeats",
#       "age":       "24",
#       "hometown":  "Denver, Colorado",
#       "occupation":"Dental Assitant",
#       "status":    "Winner"
#     },
#     {
#       "name":       "Sam Grover",
#       "age":        "29",
#       "hometown":   "New York, New York",
#       "occupation": "Entertainer",
#       "status":     "Eliminated Week 6"
#     }
#   ]
# }

def get_first_name_of_season_winner(data, season)
  # code here
  data.each do |seasons, bachelors_stat|

    if seasons.to_sym == season.to_sym
      bachelors_stat.each do |catigories_of_bachelors|
        
        catigories_of_bachelors.each do|attribute, val|
          # binding.pry
          # if val == "Winner"
        return val.split.first
          # end
        end
      end

    end
  end
 
    
end
# # get_first_name_of_season_winner(bachelor, "season 29")
# binding.pry
def get_contestant_name(data, occupation)
  
  # code here
  data.each do |seasons, bachelors_stat|
    bachelors_stat.each do |catigories_of_bachelors|
      # binding.pry
      jobs =  catigories_of_bachelors.assoc("occupation")
      if jobs[1] == occupation
        return catigories_of_bachelors.assoc("name")[1]
      end

    end
  end
  
end



def count_contestants_by_hometown(data, hometown)
  # code here
  name_bachlor = []
  data.each do |season, bachelors_stat|
    bachelors_stat.each do |each_canidate|
      each_canidate.each do |catigories_of_bachelors, home_town|
        if home_town == hometown
          name_bachlor.push( each_canidate[:name])
        end
      end
    end
  end
  return name_bachlor.length
end


def get_occupation(data, hometown)
  # code here
  data.each do |top_key, top_value|
    top_value.each do |inner_key|
      type_job = inner_key.assoc("hometown")
        
        if type_job[1] == hometown
          return inner_key.assoc("occupation")[1]
        
      end
    end
  end
end


# binding.pry
def get_average_age_for_season(data, season)
  # code here
  age_total = []
  data.each do |top_key, top_value|
    if top_key.to_sym == season.to_sym
      top_value.each do |inner_key|
        age_total << inner_key.assoc("age")[1].to_i
      end

    end
  end
  age_tot = age_total.sum(0.0) / age_total.size
  return age_tot.round()

end
# binding.pry