require "rails_helper"

RSpec.feature "Users can view tickets" do 
	before do

		author = FactoryGirl.create(:user)

		sublime = FactoryGirl.create(:project, name: "Sublime Text 3")
		FactoryGirl.create(:ticket, project: sublime,
			author: author, name: "Make it Shiny!",
			description: "Gradients! Starbursts! Oh my!")

		ie = FactoryGirl.create(:project, name: "Internet Explorer")
		FactoryGirl.create(:ticket, project: ie, author: author,
			name: "Standards Compliance", description: "Isn't a joke.")

		visit "/"
	end

		scenario "for a given project" do
			click_link "Sublime Text 3"

			expect(page).to have_content "Make it Shiny!"
			expect(page).to_not have_content "Standards Compliance"

			click_link "Make it Shiny!"
			within("#ticket h2") do
				expect(page).to have_content "Make it Shiny!"
			end

			expect(page).to have_content "Gradients! Starbursts! Oh my!"
end
	
end