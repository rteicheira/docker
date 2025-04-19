#!/bin/sh

##########
# Filename: backupwiki.sh
# Cron job location: /var/scripts
# Backup location: $HOME/docker/wikijs
# Date updated: April 19, 2025
#
# Script makes a backup of the two Wiki containers
# Scheduled to run every Sunday at midnight +1 minute
##########

mamount
todayDate=$(date +%Y%m%d);

timestamp() {
        printf $(date +'%F_%T')
}

dockerWikiExportName="$todayDate-wandererWiki2.tar"
dockerWikiDbExportName="$todayDate-wandererWikiDb2.tar"
dockerWikiDbDataExportName="$todayDate-wandererWikiDbData2.tar.gz"

timestamp
echo : Starting Wiki System backup and saving to $dockerWikiExportName...
docker export wiki-wiki-1 > $dockerWikiExportName
gzip -9 $dockerWikiExportName

timestamp
echo : Starting Wiki DB System backup and saving to $dockerWikiDbExportName...
docker export wiki-db > $dockerWikiDbExportName
gzip -9 $dockerWikiDbExportName

timestamp
echo : Starting Wiki DB Data backup and saving to $dockerWikIDbDataExportName...
/usr/local/bin/docker-volume-snapshot create wiki_db-data $dockerWikiDbDataExportName

timestamp
echo : Moving $dockerWikiExportName.gz to external storage...
mv $dockerWikiExportName.gz /var/memoryalpha/ 2>/dev/null

timestamp
echo : Moving $dockerWikiDbExportName.gz to external storage...
mv $dockerWikiDbExportName.gz /var/memoryalpha/ 2>/dev/null

timestamp
echo : Moving $dockerWikiDbDataExportName to external storage...
mv $dockerWikiDbDataExportName /var/memoryalpha/ 2>/dev/null
