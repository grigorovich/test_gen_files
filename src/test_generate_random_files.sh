#!/bin/bash
cd "$(dirname "$0")"

# Example how to output random values to files

echo "Test creating files with random files"

for i in $(seq 1 11);
do
  formatted_date_year=$(($(od -An -N2 -i /dev/urandom) % 6 + 2020))
  
  formatted_date_month=$(($(od -An -N2 -i /dev/urandom) % 12 + 1))
  foo=$(printf "%02d" $formatted_date_month)
  formatted_date_month=$foo

  formatted_date_day=$(($(od -An -N2 -i /dev/urandom) % 30 + 1))
  foo=$(printf "%02d" $formatted_date_day)
  formatted_date_day=$foo


  formatted_date=$formatted_date_year$formatted_date_month$formatted_date_day
  echo $formatted_date

  formatted_time_hour=$(($(od -An -N2 -i /dev/urandom) % 24 + 1))
  foo=$(printf "%02d" $formatted_time_hour)
  formatted_time_hour=$foo

  formatted_time_minute=$(($(od -An -N2 -i /dev/urandom) % 60 + 1))
  foo=$(printf "%02d" $formatted_time_minute)
  formatted_time_minute=$foo

  formatted_time_seconds=$(($(od -An -N2 -i /dev/urandom) % 60 + 1))
  foo=$(printf "%02d" $formatted_time_seconds)
  formatted_time_seconds=$foo
  
  formatted_time=$formatted_time_hour$formatted_time_minute$formatted_time_seconds
  
  formatted_filename=$(echo "$formatted_date")_$(echo "$formatted_time")
  
  file_var=$(echo $formatted_filename).$(echo "bin")
  file_fixed=$(echo $formatted_filename).$(echo "thumb")
  echo file var $i: $file_var
  echo file fixed size $i: $file_thumb

  file_var_size=$((($(od -An -N2 -i /dev/urandom) % 128 + 1) * 16))

  dd bs=1024 count=$file_var_size </dev/urandom >$file_var
  #dd bs=1024 count=2048 </dev/urandom >$file_bin
  dd bs=64 count=1 </dev/urandom >$file_fixed

done

echo "Done"