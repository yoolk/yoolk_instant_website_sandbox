module Yoolk
  class Listing
    attr_reader :attributes

    def initialize(attributes={})
      @hash       = attributes
      @attributes = Hashie::Mash.new(attributes)
    end

    def self.find(alias_id)
      path       = Rails.root.join('db', 'samples', 'jsons', "#{alias_id}.json")
      attributes = Oj.load(File.read(path))

      Yoolk::Listing.new(attributes)
    end

    def to_param
      "#{id}"
    end

    def products
      product_categories.map(&:products).flatten
    end

    def to_liquid
      @hash
    end

    def respond_to?(method, include_private=false)
      return true if attributes.respond_to?(method)
      super
    end

    def respond_to_missing?(method, include_private=false)
      attributes.respond_to?(method) || super
    end

    private

      def method_missing(method, *args, &block)
        if respond_to?(method)
          attributes.send(method, *args, &block)
        else
          super
        end
      end
  end
end