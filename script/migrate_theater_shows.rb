$LOAD_PATH << "./"
require 'mysql2'

require 'migrate_helpers'
require 'migrate_settings'

client = Mysql2::Client.new(:host => db_host(), :username => db_user(), :password => db_pass(), :database => db_name(), :port => db_port())
res = client.query("SELECT * from teatteri")

results = res.as_json

results.each do |row|
    title_fi = row["nimi"]
    desc_fi  = custom_htmlize(row["kuvaus"])
    starts   = row["alkuaika"]
    ends     = row["loppuaika"]
    TheaterShow.create(:title_fi => title_fi, :description_fi => desc_fi, :starts => starts, :ends => ends)
end
