#!/bin/bash
rm -rf /tmp/sbom-*
docker image ls | cut -d " " -f1 | grep -v "REPO" | while read line; do docker sbom $line --format cyclonedx-json --output $line.json; done
echo "Done with analyzing Components in Docker Images"
