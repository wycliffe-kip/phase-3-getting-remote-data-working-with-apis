require 'net/http'
 require 'open-uri'
 require 'json'
 
 class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_response_body
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse_json
    programs = JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]
    end
  end

end

#  programs = GetPrograms.new.get_programs
#  puts programs
programs = GetPrograms.new 
puts programs.program_school.uniq