require 'profession/version'
require 'yaml'

module Profession
  PROFESSIONS_YML       = YAML.load_file(File.join(File.dirname(__FILE__), 'profession', 'professions.yml'))
  PROFESSIONS           = PROFESSIONS_YML.map { |_, v| v }.flatten.compact.sort
  PROFESSIONS_DOWNCASED = PROFESSIONS.map(&:downcase)

  class Profession
    class << self
      def size
        PROFESSIONS.map { |v| v }.flatten.size
      end

      def list
        PROFESSIONS
      end

      def contains_exact?(option)
        PROFESSIONS_DOWNCASED.include? clean_downcase_profession(option)
      end

      def exact_match(option)
        PROFESSIONS_DOWNCASED.
          select { |x| x == clean_downcase_profession(option) }.
          map do |str|
          str.split(' ').
            map(&:capitalize).join(' ')
        end
      end

      def match(option)
        PROFESSIONS_DOWNCASED.
          select { |x| x.include? clean_downcase_profession(option) }.
          map do |str|
          str.split(' ').
            map(&:capitalize).join(' ')
        end
      end

      private

        def clean_downcase_profession(option)
          option.to_s.strip.split(' ').map(&:strip).join(' ').downcase
        end
    end
  end

  class ProfessionNotFound < StandardError
    def initialize(msg = 'This profession is not yet on the list')
      super
    end
  end
end
