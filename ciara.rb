require "google/cloud/pubsub"
require "json"

class Ciara
  attr_reader :pubsub,
              :topic_name,
              :gcloud_project,
              :gcloud_keyfile,
              :subscription_name,
              :clair_server

  def initialize (gcloud_project:nil, gcloud_keyfile:nil, topic_name:nil, subscription_name:nil,  clair_server:nil)
    @topic_name = topic_name || ENV['TOPIC_NAME'] || default_topic_name
    @gcloud_project = gcloud_project || ENV['GCLOUD_PROJECT'] || default_gcloud_project
    @gcloud_keyfile = gcloud_keyfile || ENV['GCLOUD_KEYFILE'] || default_gcloud_keyfile

    @subscription_name = subscription_name || ENV['SUBSCRIPTION_NAME'] || default_subscription_name
    @clair_server = clair_server || ENV['CLAIR'] || default_clair_server

    @pubsub = Google::Cloud::Pubsub.new(project: @gcloud_project, keyfile: @gcloud_keyfile)

  end

  def default_topic_name
     "cloud-builds"
  end

  def default_gcloud_project
    "docker-image-builder-179319"
  end

  def default_gcloud_keyfile
    "./deploy-pipeline-poc-8cde95868dd7.json"
  end

  def default_clair_server
    throw RequiredFieldException
  end

  def default_subscription_name
    "cloud-build-jobs"
  end

  def run
    topic = @pubsub.get_topic(topic_name)
    subscription = topic.get_subscription(@subscription_name)
    pubsub_messages = subscription.pull

    pubsub_messages.each do |message|
      payload = JSON.parse(message.data)
      puts "DEBUG: (#{__LINE__}): message_id : #{message.message_id} \n build status: #{payload['status']} \n gcr images: #{payload['images']} "
    end
  end

  def run_clairctl ()

  end

end

if  __FILE__ == $0
  ciara = Ciara.new(subscription_name:"bcolfer-clair-builds", clair_server:"foo")

  ciara.run

end