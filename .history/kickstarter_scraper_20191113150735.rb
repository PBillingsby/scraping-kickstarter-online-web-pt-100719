require "nokogiri"
require "pry"
 
def create_project_hash
  # projects: kickstarter.css("li.project.grid_4").first
  # title: project.css("h2.bbcard_name strong a").text
  # image link: project.css("div.project-thumbnail a img").attribute("src").value
  # description: project.css("p.bbcard_blurb").text


  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
 
  projects = {}
  binding.pry
end
 
create_project_hash