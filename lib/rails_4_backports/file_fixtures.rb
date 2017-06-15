# Methods backported from Rails 5:
# http://api.rubyonrails.org/classes/ActiveSupport/Testing/FileFixtures.html
module Rails4Backports
  module Testing
    # Adds simple access to sample files called file fixtures.
    # File fixtures are normal files stored in
    # <tt>ActiveSupport::TestCase.file_fixture_path</tt>.
    #
    # File fixtures are represented as +Pathname+ objects.
    # This makes it easy to extract specific information:
    #
    #   file_fixture("example.txt").read # get the file's content
    #   file_fixture("example.mp3").size # get the file size
    module FileFixtures
      def self.file_fixture_path=(path)
        @path = path
      end

      def self.file_fixture_path
        @path
      end

      # Returns a +Pathname+ to the fixture file named +fixture_name+.
      #
      # Raises +ArgumentError+ if +fixture_name+ can't be found.
      def self.file_fixture(fixture_name)
        path = Pathname.new(File.join(file_fixture_path, fixture_name))

        if path.exist?
          path
        else
          msg = "the directory '%s' does not contain a file named '%s'"
          raise ArgumentError, msg % [file_fixture_path, fixture_name]
        end
      end
    end
  end
end
