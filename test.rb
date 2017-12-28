require 'open-uri'
require 'json'

page_url = "https://www.breckenridge.com/the-mountain/mountain-conditions/terrain-and-lift-status.aspx"

html = open(page_url).read
js = html.match(/FR\.TerrainStatusFeed = (\{.*?\};)/m)[1]
js.chop!
#puts js
#json = js.gsub(/(\w+):/i, '"\1":').gsub(/'/, '"')
status = JSON.parse(js)

# Lift Status:
#  0: Closed
#  1: Open
#  2: On-Hold
# Run Type:
#  1: Green
#  2: Blue
#  4: Black
#  5: Double Black
#  7: Terrain Park
