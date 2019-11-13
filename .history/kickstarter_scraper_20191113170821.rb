require "nokogiri"
require "pry"
 
def create_project_hash
  # projects: kickstarter.css("li.project.grid_4")
  # title: kickstarter.css("h2.bbcard_name strong a").text
  # image link: kickstarter.css("div.project-thumbnail a img").attribute("src").value
  # description: kickstarter.css("p.bbcard_blurb").text
  # location: kickstarter.css("ul.project-meta span.location-name").text
  # percent funded: kickstarter.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i

  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}
 
  kickstarter.css("li.project.grid_4").each do |project| # Searches through raw HTML assigned to kickstarter variable
    title = project.css("h2.bbcard_name strong a").text # Creates title from bbcard_name class
    projects[title.to_sym] = { # Adds data to hash using Symbol selectors
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end
  projects
end
 
create_project_hash