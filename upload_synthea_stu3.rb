require 'rest-client'
require 'pry'

history_filepath = File.join('..', 'synthea', 'output', 'fhir_stu3', '*.json')

Dir.glob(history_filepath).shuffle.each do |file|
  # binding.pry
  puts "Uploading #{file}"
  response = RestClient.post('http://localhost:8080/cqf-ruler/baseDstu3',
                             JSON.parse(File.read(file)).to_json,
                             content_type: :json, accept: :json, timeout: 240)
  puts "#{file} uploaded with response code #{response.code}"
end
