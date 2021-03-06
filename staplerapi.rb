#!/usr/bin/env ruby

# This file is part of Library Stapler API.
#
# Library Stapler API is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Library Stapler API is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Library Stapler API.  If not, see <http://www.gnu.org/licenses/>.
#
# Copyright 2013 William Denton

# CONFIGURING
#
# Configuration details are set in the file config.json.
# Make a copy of config.json.example and edit it.

# This would be better if it got random words from somwhere.
# Perhaps Wordnik, as Darius Kazemi describes here?
# http://tinysubversions.com/2012/05/how-i-built-metaphor-a-minute/

require 'json'

require 'rubygems'
require 'bundler/setup'

require 'sinatra'
# require 'sinatra/respond_with'

before do
  # Make this the default
  content_type 'application/json'
end

# configure do
#   begin
#     set(:config) { JSON.parse(File.read("config.json")) }
#   rescue Exception => e
#     puts e
#     exit
#   end
# end

normality_probability = 20
normality_condition = "functioning normally"

abnormal_conditions = [
  "jammed",
  "in use",
  "being repaired",
  "under investigation",
  "missing",
  "lost",
  "stolen",
  "in the dean's office",
  "broken",
  "being used by a student at her desk",
  "empty",
  "feeling guilty",
  "underappreciated",
  "on its last legs",
  "unsure",
  "staring into the abyss",
  "content",
  "taking Manhattan, and then it will take Berlin",
  "recovering from a PhD dissertation",
  "damp",
  "tired",
  "hungry",
  "totes emosh!",
  "equanimous",
  "concerned that budget cuts will mean low-quality staples",
  "feeling mighty fine today and hopes you are too",
  "going in for a tune-up",
  "pining for the fjords",
  "mad as hell and it's not going to take it any more",
  "daunted",
  "nicked slightly",
  "looking admiringly at the three-hole punch"
]

how_many = 5
highest_number = 24

get "/" do

  stapler_numbers = [*1..highest_number].sample(how_many)

  statuses = []

  stapler_numbers.each do |number|
    if rand(1..100) <= normality_probability
      condition = normality_condition
    else
      condition = abnormal_conditions.sample
    end
    status = {
      "number" => number,
      "condition" => condition
    }
    statuses << status
  end

  statuses.to_json

  # TODO: Provide human-readable human view

end
