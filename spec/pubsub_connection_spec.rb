require "rspec"

module PubsubConnection
  describe PubsubConnection do

    context "the keyfile can be found" do
      let (:directory) { 'keyfile_dir'}
      let (:keyfile) { 'keyfile.json' }

      before (:each) do
        create_directory(directory)
        cd directory
        touch(keyfile)
        cd "../"
      end

      it {expect(directory).to be_an_existing_directory}

    end
=begin 
    context "with a valid connection" do
      let(:pubsub_connection) {PubsubConnection.new}

    end

    context "with a invalid connection" do
      let(:gcloud_project) {}
    end 
=end

  end
end

