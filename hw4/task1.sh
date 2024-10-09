#!/bin/bash
                               
ps | grep infinite | grep -v grep | gawk '{print $1}' | xargs kill
