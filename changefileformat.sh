#!/bin/bash
for file in *.yaml
do
 mv "$file" "${file%.yaml}.yml"
done
