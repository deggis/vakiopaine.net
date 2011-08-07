Given /^I have no exhibitions$/ do
  Exhibition.delete_all
end

Given /^I (only )?have exhibitions titled "?([^\"]*)"?$/ do |only, titles|
  Exhibition.delete_all if only
  titles.split(', ').each do |title|
    Exhibition.create(:title_fi => title)
  end
end

Then /^I should have ([0-9]+) exhibitions?$/ do |count|
  Exhibition.count.should == count.to_i
end
