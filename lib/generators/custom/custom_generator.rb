#class CustomGenerator < Rails::Generators::NamedBase
#  source_root File.expand_path('../templates', __FILE__)
#end
#

class Custom
  module Generators
    class CustomGenerator < Erb::Generators::ScaffoldGenerator
      extend TemplatePath


      def copy_view_files
        views = available_views

        views.each do |view|
          template "#{view}.jst.eco", File.join("app/assets/javascripts/templates", controller_file_path, "#{view}.jst.eco")
        end
      end

      private
      def available_views
        %w(index edit show new)
      end
    end
  end
end
