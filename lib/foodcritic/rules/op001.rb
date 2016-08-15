# frozen_string_literal: true
# custom foodcritic rule OP001
require 'yaml'

rule 'OP001', 'Include a kitchen test suit for every recipe not included by another' do
  tags %w(testing op coverage kitchen)
  cookbook do |cookbook_path|
    matches = []
    recipes = Dir.glob(File.join(cookbook_path, 'recipes/*.rb'))

    # Preload and parse Kitchen
    kitchen = File.read(File.join(cookbook_path, '.kitchen.yml'))
    kitchen = ERB.new(kitchen).result # Kitchen file is commenly an erb.
    kitchen = YAML.load(kitchen)

    recipes.each do |recipe|
      recipe_name = File.basename(recipe, '.rb')

      included_in_another_recipe = false
      recipes.each do |recipe_include|
        File.foreach(recipe_include) do |line|
          if line.include?('include_recipe') &&
             (line.include?('::' + recipe_name << '\'') ||
              line.include?('::' + recipe_name << '"'))
            included_in_another_recipe = true
            break
          end
        end
        break if included_in_another_recipe
      end

      # rubocop:disable Style/Next
      unless included_in_another_recipe
        # rubocop:enable Style/Next
        recipe_in_kitchen = false
        # Verify it's in kitchen test suite
        kitchen['suites'].each do |suite|
          suite['run_list'].each do |run_line|
            if run_line.include?(recipe_name + ']')
              recipe_in_kitchen = true
              next
            end
            next if recipe_in_kitchen
          end
          next if recipe_in_kitchen
        end
        matches << file_match(recipe) unless recipe_in_kitchen
      end
    end

    matches
  end
end
