def custom_htmlize(raw)
#  raw = raw.sub(/Ã¤/, "ä")
#  raw = raw.sub(/Ã¶/, "ö")
  return "<p>"+raw.sub("\r\n","</p>\r\n<p>")+"</p>"
end
