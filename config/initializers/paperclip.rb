	#config/initilizers/paperclip.rb
require 'paperclip/media_type_spoof_detector'
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end

    private

    def type_from_file_command
      # -- original code removed --
      # begin
      #   Paperclip.run("file", "-b --mime-type :file", :file => @file.path)
      # rescue Cocaine::CommandLineError
      #   ""
      # end

      # -- new code follows --
      begin
         Paperclip.run("file", "-b --mime :file", :file => @file.path)
      rescue Cocaine::CommandLineError
        ""
      end
    end
  end
end