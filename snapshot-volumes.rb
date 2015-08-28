#!/usr/bin/ruby

require 'aws-sdk-v1'
# Environment vars. AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY set
ec2 = AWS::EC2.new

ec2.volumes.each do |volume|
  puts volume
  next if volume.status != :in_use
  name = volume.tags['Name']
  snapshot = volume.create_snapshot
  snapshot.add_tag('Name', :value => name) if name
  puts "AUTOMATION - Snapshot of #{volume.id} (#{name}) initiated at #{snapshot.start_time}"
end

