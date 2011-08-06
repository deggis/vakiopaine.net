Given /^I have no newsitems$/ do
  Newsitem.delete_all
end

Given /^I (only )?have newsitems titled "?([^\"]*)"?$/ do |only, titles|
  Newsitem.delete_all if only
  titles.split(', ').each do |title|
    Newsitem.create(:title_fi => title)
  end
end

Then /^I should have ([0-9]+) newsitems?$/ do |count|
  Newsitem.count.should == count.to_i
end
