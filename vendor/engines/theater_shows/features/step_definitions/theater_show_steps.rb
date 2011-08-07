Given /^I have no theater_shows$/ do
  TheaterShow.delete_all
end

Given /^I (only )?have theater_shows titled "?([^\"]*)"?$/ do |only, titles|
  TheaterShow.delete_all if only
  titles.split(', ').each do |title|
    TheaterShow.create(:title_fi => title)
  end
end

Then /^I should have ([0-9]+) theater_shows?$/ do |count|
  TheaterShow.count.should == count.to_i
end
