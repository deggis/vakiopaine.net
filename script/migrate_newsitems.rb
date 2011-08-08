$LOAD_PATH << "./"
require 'mysql2'

require 'migrate_helpers'
require 'migrate_settings'

client = Mysql2::Client.new(:host => db_host(), :username => db_user(), :password => db_pass(), :database => db_name())
res = client.query("SELECT * from uutiset")

results = res.as_json

results.each do |row|
    title_fi   = row["otsikko"]
    desc_fi    = custom_htmlize(row["sisalto"])
    created_at = row["pvm"]
    Newsitem.create(:title_fi => title_fi, :desc_fi => desc_fi, :created_at => created_at)
end
