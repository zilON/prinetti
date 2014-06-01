require 'spec_helper'

describe Prinetti::Client do
  subject{ Prinetti::Client.new("test_key", "test_secret") }
  let(:message) { subject.message }

  it "does stuff" do
    message.sender.name1 = "Bob"
    message.recipient.name1 = "Loe"
    message.routing.time = nil
    # expect(subject.request).to eq "<?xml version=\"1.0\"?>\n<eChannel><ROUTING/>\n<Shipment><Shipment.Sender><Sender.Name1>Bob</Sender.Name1></Shipment.Sender>\n<Shipment.Recipient><Recipient.Name1>Loe</Recipient.Name1></Shipment.Recipient>\n</Shipment></eChannel>\n"
    response = subject.request

    p response.http_status
    p response.http_body
    p response.status
    p response.message
  end

end
