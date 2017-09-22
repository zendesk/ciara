require "google/cloud/pubsub"

pubsub = Google::Cloud::Pubsub.new(project: "docker-image-builder-179319",keyfile: "./deploy-pipeline-poc-8cde95868dd7.json")

topic_name = "cloud-builds"
subscription_name = "bcolfer-clair-builds"

topic = pubsub.get_topic topic_name

subscription = topic.get_subscription subscription_name

sub_msgs = subscription.pull

sub_msgs.each do |msg|
  puts "message:  #{msg}"
end

