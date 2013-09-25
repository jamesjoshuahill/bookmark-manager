require 'spec_helper'

feature "Allow links to have tags" do
  
  scenario "with a few tags" do
    visit "/"
    add_link_with_tag("http://www.makersacademy.com/", 
                "Makers Academy", 
                ['education', 'ruby'])    
    link = Link.first
    expect(link.tags.map(&:text)).to include("education")
    expect(link.tags.map(&:text)).to include("ruby")
  end

end