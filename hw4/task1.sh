#!/bin/bash
                               
pid=$(ps | grep infinite | grep -v grep | gawk '{print $1}')
kill $pid