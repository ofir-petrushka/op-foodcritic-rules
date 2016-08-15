# frozen_string_literal: true
# A sample recipe, which will be in .kitchen.yml
include_recipe '::tested_by_include_single_quotes'
# rubocop:disable Style/StringLiterals - sometimes this style would be in use for various reasons
include_recipe "::tested_by_include_double_quotes"
# rubocop:enable Style/StringLiterals
