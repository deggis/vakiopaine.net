$LOAD_PATH << "./"
require 'mysql2'

require 'migrate_helpers'
require 'migrate_settings'

client = Mysql2::Client.new(:host => db_host(), :username => db_user(), :password => db_pass(), :database => db_name())
res = client.query("SELECT * from nayttelyt")

results = res.as_json

results.each do |row|
    title_fi = row["nimi"]
    desc_fi  = custom_htmlize(row["kuvaus"])
    author   = row["taiteilija"]
    starts   = row["alkuaika"]
    ends     = row["loppuaika"]
    Exhibition.create(:title_fi => title_fi, :description_fi => desc_fi, :starts => starts, :ends => ends)
end
