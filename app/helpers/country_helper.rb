# app/helpers/country_helper.rb
module CountryHelper
    def country_name_and_flag(code)
      country = ISO3166::Country[code]
      return nil unless country
      
      name = country.translations['en'] || country.name
      flag = country.emoji_flag
  
      "#{flag} #{name}"
    end
  end
  