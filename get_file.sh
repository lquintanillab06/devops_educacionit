#!/bin/bash

# Otra prueba aaa
 
url=https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/apache_logs/apache_logs
echo $url
response=$( curl $url )
echo $response

filter=$(grep "logstash" $response)

echo "****************************"
echo $filter

