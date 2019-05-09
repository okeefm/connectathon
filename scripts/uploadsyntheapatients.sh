#!/usr/bin/env bash

BASE_URL=${1:-http://localhost:8080/cqf-ruler/baseDstu3}

for f in ../../synthea/output/fhir_stu3/*.json; 
do 
echo 'Posting' "$f";
curl "$BASE_URL" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X POST \
--data @<(cat "$f")
done
