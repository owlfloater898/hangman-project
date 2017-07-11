require 'rest-client'
require 'json'

class Word
  def self.get_random_word(max_length)
    url = "http://api.wordnik.com/v4/words.json/randomWord?hasDictionaryDef=true&minLength=4&maxLength=#{max_length}&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5"
    word_api = RestClient.get(url)
    word_hash = JSON.parse(word_api)
    word_hash["word"]
  end

  def self.definition(word)
    url = "http://api.wordnik.com/v4/word.json/#{word.downcase}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5"
    word_api = RestClient.get(url)
    word_hash = JSON.parse(word_api)
    if word_hash[0] != nil 
      word_hash[0]['text']
    else
      ""
    end
  end
end