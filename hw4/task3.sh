#!/bin/bash

gawk -F, '$3 == 2 && $13 > "R" { print $0 }' titanic.csv | sed 's/female/F/; s/male/M/' | gawk -F, '{ print $0 } { if ($7 > 0) { sum += $7; count++ } } END { print "Average Age: " sum / count }'
