# Working as of 04/27/2021

# Determine the courses default view of the published courses with enrollments

require 'typhoeus'
require 'json'
require 'csv'

canvas_url = '' # put full canvas test url eg: https://school.test.instructure.com
canvas_token = '' # put canvas API token here
csv_file = '' # full path to api_courses.csv  eg: full/path/to/file/output.csv
account_id = '' # put the account (sub-account) id
counter = 0
success_count = 0
fail_count = 0
start_timer = Time.now

hydra = Typhoeus::Hydra.new(max_concurrency: 10) 
CSV.open(csv_file, 'wb') do |csv|
    csv << ["canvas_course_id", "sis_course_id", "name", "default_view"]
end

get_courses = Typhoeus::Request.new(
    "#{canvas_url}/api/v1/accounts/#{account_id}/courses",
    method: :get,
    headers: { authorization: "Bearer #{canvas_token}" },
    params:{
        "with_enrollments" => true,
        "published" => true
    }
    )

get_courses.on_complete do |response|
    #puts response.headers
    if response.code == 200
        data = JSON.parse(response.body)
        data.each do |courses|
            counter += 1
            #puts "#{counter} - #{courses['name']} (#{courses['id']}) has #{courses['default_view']} as default view"
            CSV.open(csv_file, 'a') do |csv|
                csv << [courses['id'], courses['sis_course_id'], courses['name'], courses['default_view'] ]
            end
        end
    else
        puts "Something went wrong! Response code was #{response.code}"
    end
end

#get_courses.run
hydra.queue(get_courses)
hydra.run

finish_timer = Time.now
diff = finish_timer - start_timer
puts "Script done running! Took #{diff} seconds to run."