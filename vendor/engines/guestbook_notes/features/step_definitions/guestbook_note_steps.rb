Given /^I have no guestbook_notes$/ do
  GuestbookNote.delete_all
end

Given /^I (only )?have guestbook_notes titled "?([^\"]*)"?$/ do |only, titles|
  GuestbookNote.delete_all if only
  titles.split(', ').each do |title|
    GuestbookNote.create(:writer_name => title)
  end
end

Then /^I should have ([0-9]+) guestbook_notes?$/ do |count|
  GuestbookNote.count.should == count.to_i
end
