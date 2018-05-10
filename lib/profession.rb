require 'profession/version'
require 'yaml'

module Profession
  PROFESSIONS_YML = YAML.load_file(File.join(File.dirname(__FILE__), 'profession', 'profession.yml'))
  PROFESSIONS     = PROFESSION_YML.map { |_, v| v }.flatten.compact.sort

  class Profession
    class << self
      def size
        PROFESSION.map { |v| v }.flatten.size
      end

      def includes?(option)
        PROFESSIONS.include? clean_profession(option)
      end

      private

        def clean_profession(option)
          option.to_s.strip.squish.downcase
        end
    end
  end

  class ProfessionNotFound < StandardError
    def initialize(msg = 'This profession is not yet on the list')
      super
    end
  end
end
