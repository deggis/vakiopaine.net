$LOAD_PATH << "./"
require 'mysql2'

require 'migrate_helpers'
require 'migrate_settings'

client = Mysql2::Client.new(:host => db_host(), :username => db_user(), :password => db_pass(), :database => db_name(), :port => db_port())
res = client.query("SELECT * from tapahtumat")

results = res.as_json

results.each do |row|
    title_fi   = row["tapahtuma"]
    desc_fi    = custom_htmlize(row["kuvaus"])
    date       = row["pvm"]
    Event.create(:title_fi => title_fi, :desc_fi => desc_fi, :date => date)
end
