# -*- encoding : utf-8 -*-
require "open-uri"
require 'fastimage'
module Rubyword
  module Element
    class Image < Base
      attr_accessor :images

      def write_object(url, style=nil)
        @images ||= Queue.new
        filename = url.split('/').last
        width, height = FastImage.size(url)
        image_params = {
          rid: @rubyword.init_rid,
          path: url,
          width: width,
          height: height,
          filename: filename
        }
        @images << image_params
        @rubyword.images << image_params
        @rubyword.rels_documents << {
          Id: "rId#{@rubyword.init_rid}",
          Type: 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image',
          Target: "media/#{filename}"
        }
        @rubyword.init_rid = @rubyword.init_rid + 1
      end

    end
  end
end