require "nokogiri"
require "pry"
 
def create_project_hash
  # projects: kickstarter.css("li.project.grid_4")

  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  binding.pry
end
 
create_project_hash