#!/bin/bash
# reads all online nodes and creates an HTML page from the template numnodes.template
MESHVIEWER_URL="http://mesh.ffki.de/"
JSON=/opt/ffmap-backend-neu/json/nodes.json
# download each time:
#wget $MESHVIEWER_URL/nodes.json -qO $JSON

echo -n "online nodes: "
num="$(cat $JSON |jq '.nodes[] | select(.flags.gateway==false) | select(.flags.online==true)'|grep online|wc -l)"
num=$(expr $num - 4)
cd `dirname "$0"`
sed 's/<NUM_NODES>/'$num'/g' numnodes.template > _site/numnodes.html
sed -i 's§<MESHVIEWER_URL>§'$MESHVIEWER_URL'§g' _site/numnodes.html

#echo -n "offlilne nodes: "
#cat $JSON |jq '.nodes[] | select(.flags.gateway==false) | select(.flags.online==false)'|grep online|wc -l
