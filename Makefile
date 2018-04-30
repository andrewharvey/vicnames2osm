download:
	mkdir -p data
	wget -O data/places.csv 'https://maps.land.vic.gov.au/lassi/vicnames/dataDownload.json?featIds=all&munIds=all&downloadHI=true&downloadPR=P&appName=VICNAMES'
	wget -O data/roads.csv 'https://maps.land.vic.gov.au/lassi/vicnames/dataDownload.json?featIds=all&munIds=all&downloadHI=true&downloadPR=R&appName=VICNAMES'

geojson:
	ogr2ogr -f GeoJSON data/places.geojson data/places.csv -oo X_POSSIBLE_NAMES=Longitude -oo Y_POSSIBLE_NAMES=Latitude -oo KEEP_GEOM_COLUMNS=NO -sql 'SELECT "Place Name" AS name, "Place Name Status" AS status, "Feature Type Code" AS type, "Historical Information" AS "name:origin", "Origin Language" AS "origin_lang", "Australian Indigenous Language" AS aus FROM places'
	ogr2ogr -f GeoJSON data/roads.geojson data/roads.csv -oo X_POSSIBLE_NAMES=Longitude -oo Y_POSSIBLE_NAMES=Latitude -oo KEEP_GEOM_COLUMNS=NO -sql 'SELECT "Place Name" AS name, "Place Name Status" AS status, "Feature Type Code" AS type, "Historical Information" AS "name:origin", "Origin Language" AS "origin_lang", "Australian Indigenous Language" AS aus FROM roads'

