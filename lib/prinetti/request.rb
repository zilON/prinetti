module Prinetti
  module Request
    class Message
      def initialize
        @routing    = Prinetti::Request::Routing.new("Routing")
        @sender     = Prinetti::Request::Contact.new("Sender")
        @recipient  = Prinetti::Request::Contact.new("Recipient")
      end

      attr_accessor :routing, :sender, :recipient

      def to_xml
        Nokogiri::XML::Builder.new do |xml|
          xml.eChannel do
            xml << @routing.to_xml
            xml.Shipment do
              xml << @sender.to_xml
              xml << @recipient.to_xml
            end
          end
        end.to_xml
      end
    end

    class Serializable
      def initialize(namespace)

        fields.each do |field|
          self.class.class_eval { attr_accessor field }
        end
        @namespace = namespace
      end

      def root; end

      def to_xml
        Nokogiri::XML::Builder.new do |xml|
          xml.send(root) do
            fields.each do |field|
              value = send(field)
              xml.send(:"#{@namespace}.#{field.to_s.capitalize}", value) if value
            end
          end
        end.to_xml(save_with: Nokogiri::XML::Node::SaveOptions::NO_DECLARATION)
      end

      def fields
        %i()
      end
    end

    class Contact < Serializable
      def root
        :"Shipment.#{@namespace}"
      end

      def fields
        %i(contractid name1 name2 addr1 addr2 addr3 post_code city country phone vatcode email)
      end
    end

    class Routing < Serializable
      def initialize(namespace)
        super
        @time = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
      end

      def root
        :"ROUTING"
      end

      def fields
        %i(target source account key id name time version mode comment)
      end
    end
  end
end
