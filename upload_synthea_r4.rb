require 'rest-client'
require 'pry'

history_filepath = File.join('..', 'synthea', 'output', 'fhir_r4', '*.json')

Dir.glob(history_filepath).shuffle.each do |file|
  # binding.pry
  puts "Uploading #{file}"
  response = RestClient.post('http://localhost:8080/cqf-ruler/baseR4',
                             JSON.parse(File.read(file)).to_json,
                             content_type: :json, accept: :json)
  puts "#{file} uploaded with response code #{response.code}"
end
