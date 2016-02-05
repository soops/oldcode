###
nerd v1.0
a library of nerdy but useful functions
written in my favorite JavaScript precompiler, CoffeeScript
###

class Nerd
  ###
  "Nerd::rand"
  a few functions that generate random things
  ###
  rand:
    # random int function
    int: (min, max) ->
      Math.floor (Math.random() * max) + min;
    
    # random float function
    float: (min, max) ->
      Math.random() * (max - min) + min;
    
    # random character from string function
    character: (defCharSet) ->
      defCharSet ?= '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~'
      defCharSet.charAt Nerd::rand.int(1, defCharSet.length)
    
    # random word function
    word: (length) ->
      # retrieved from http://codegolf.stackexchange.com/questions/11877/generate-a-pronouncable-word
      a = ''
      e = length
      while e--
        a += (b = if e & 1 then 'bcdfghjklmnpqrstvwxz' else 'aeiouy')[0 | Math.random() * b.length]
      return a
    
    # random string of random things function
    parse: (parse) ->
      parsed = parse
      # insert capitalized words where there is a '/Ww'
      parsed = parsed.replace /\/Ww/g, ->
        # Capitalize random word
        string = Nerd::rand.word(Nerd::rand.int(3, 7))
        string.charAt(0).toUpperCase() + string.slice(1);
      # insert lowercase words where there is a '/w'
      parsed = parsed.replace /\/w/g, -> Nerd::rand.word(Nerd::rand.int(3, 7))
      # insert uppercase words where there is a '/W'
      parsed = parsed.replace /\/W/g, -> Nerd::rand.word(Nerd::rand.int(3, 7)).toUpperCase()
      
      # insert uppercase or lowercase letters where there is a '/Ll'
      parsed = parsed.replace /\/Ll/g, -> Nerd::rand.character("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
      # insert lowercase letters where there is a '/l'
      parsed = parsed.replace /\/l/g, -> Nerd::rand.character("abcdefghijklmnopqrstuvwxyz")
      # insert uppercase letters where there is a '/L'
      parsed = parsed.replace /\/L/g, -> Nerd::rand.character("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
      
      # insert digits where there is a '/d'
      parsed = parsed.replace /\/d/g, -> Nerd::rand.int(0, 10, true)
      
      return parsed
  
  ###
  "Nerd::data"
  a few functions that store, retrieve
  ###
  data:
    ###
    this will store a variable in ls or as a cookie, depending on HTML5 support
    anyway it doesn't really matter because Nerd::data.retrieve is smart enough
    to figure out when the variable is stored as a cookie or in ls
    ###
    store: (variable, variableName) ->
      if Nerd::data.toType(variableName) == "string"
        # set type as a variable
        type = Nerd::data.toType(variable)
        
        if localStorage?
          # set a new localstorage item and stringify it as JSON just in case
          localStorage.setItem variableName, JSON.stringify(variable)
          # specify the original type of variable
          localStorage.setItem "#{variableName}Type", type
        else
          # append a new cookie to the URL cookies and stringify it as JSON just in case, but also specify the original type of variable
          setCookie variableName, JSON.stringify(variable)
          setCookie "#{variableName}Type", type
      else
        # throw error, variablename can only be a string
        console?.error "variableName is not a string. Instead, it is type #{Nerd::data.toType(variableName)}. Variable names can only be strings."
    
    ###
    better version of "typeof"
    ###
    toType: (obj) ->
      {}.toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase()
    
    ###
    cookie getter
    ###
    getCookie:  (name) ->
      nameEQ = name + "="
      ca = document.cookie.split(";")
      i = 0
      while i < ca.length
        c = ca[i]
        c = c.substring(1, c.length)  while c.charAt(0) is " "
        return c.substring(nameEQ.length, c.length).replace(/"/g, '')  if c.indexOf(nameEQ) is 0
        i++
      return ca
    
    ###
    cookie setter
    ###
    setCookie: (name, value, days) ->
      if days
        date = new Date()
        date.setTime date.getTime() + (days * 24 * 60 * 60 * 1000)
        expires = "; expires=" + date.toGMTString()
      else
        expires = ""
      document.cookie = name + "=" + value + expires + "; path=/"
    
    ###
    this will get a variable stored with Nerd from ls or from the document cookies
    it will then parse and convert it based on the type that it is given from
    Nerd::data.store
    ###
    retrieve: (variableName) ->
      if Nerd::data.toType(variableName) == "string"
        if localStorage?
          # get type and stringified JSON
          obj = JSON.parse localStorage.getItem(variableName)
          type = localStorage.getItem "#{variableName}Type"
        else
          # get cookies
          obj = JSON.parse JSON.stringify(Nerd::data.getcookie(variableName))
          typeName = variableName + "Type"
          type = Nerd::data.getCookie(typeName)
        # type conversions
        switch type
          when "string"
            obj = obj.toString()
          when "number"
            obj = Number(obj)
          when "boolean"
            obj = obj.toString()
            switch obj
              when "true"
                obj = true
              when "false"
                obj = false
          when "array"
            obj = Object.keys(obj).map((x) -> obj[x])
        
        # return object
        return obj
      else
        # throw error, variablename can only be a string
        console?.error "variableName is not a string. Instead, it is type #{Nerd::data.toType(variableName)}. Variable names can only be strings."

  ###
  "Nerd::readify"
  a few functions that turn variables into readable formats
  ###
  
  readify:
    ###
    generates an HTML list from anything, whether it be a multilevel JSON tree, a simple
    string, or an array. Hell, maybe an array that stores a simple string, an integer, and
    a multilevel JSON tree that has an array with another multilevel JSON tree inside of it.
    Whatever you throw at this function, it will parse it into an HTML list and return it as
    a string which you can inflict on a <div> or something.
    ###
    objectToHTMLList: (item) ->
      genlist = "";
      
      # start looping through item
      if Array.isArray(item) then genlist += Nerd::readify.recursive.array item
      else if typeof item == "object" && item? then genlist += Nerd::readify.recursive.object item
      else genlist += Nerd::readify.recursive.other item
      
      return genlist
    
    ###n
    All of the recursive stuff for Nerd::readify.objectToHTMlList and Nerd::readify.numberToEnglishString is stored inside this pocket,
    just for organizational sake.
    ###
    recursive:
      object: (obj) ->
        genlist = "<dl>\n"
        
        for key, value of obj
          if obj.hasOwnProperty(key)
            genlist += "<dt>#{key}</dt>\n"
            if Array.isArray(value) then genlist += "<dd>#{Nerd::readify.recursive.array value}</dd>\n" # loop through array item
            else if typeof value == "object" && value? then genlist += "<dd>#{Nerd::readify.recursive.object value}</dd>\n" # loop through object item
            else genlist += "<dd>#{Nerd::readify.recursive.other value}</dd>\n" # loop through normal item
        
        genlist += "</dl>\n"
        return genlist
      
      array: (list) ->
        genlist = "<ol>\n" # begin list
        
        # iterate over array
        for item in list
          if Array.isArray(item) then genlist += "<li>#{Nerd::readify.recursive.array item}</li>\n" # loop through array item
          else if typeof item == "object" && item? then genlist += "<li>#{Nerd::readify.recursive.object item}</li>\n" # loop through object item
          else genlist += "<li>#{Nerd::readify.recursive.other item}</li>\n" # loop through normal item
        
        genlist += "</ol>\n" # finish list
        return genlist
      
      other: (variable) ->
        "#{variable}" # return variable... honestly this function doesn't do shit...
      
      
      # beyond this point is Nerd::readify.numberToEnglishString
      convert_less_than_hundred: (number) ->
        return ones[number] if number < 20
        for i in [0..tens.length]
            tempVal = 20 + 10 * i
            if tempVal + 10 > number
                if (number % 10 != 0)
                    return tens[i] + " " + ones[number % 10]
                return tens[i]
 
      convert_less_than_thousand: (number) ->
          word = ""
          remainder = parseInt(number / 100, 10)
          modulus = parseInt(number % 100, 10)
          if remainder > 0
              word = ones[remainder] + " hundred"
              if modulus > 0
                  word = word + " "
          if modulus > 0
              word = word + Nerd::readify.recursive.convert_less_than_hundred modulus
          word
   
      check_negative: (number, word) ->
          return if number < 0 then "negative " + word else word
      
    ###
    this function turns an array into a string as a comma separated list, like this:
    ["red", "blue", "yellow"] -> "red, blue, and yellow"
    ###
    arrayToEnglishList: (array) ->
      if Nerd::data.toType(array) == "array" && array
        list = ""
        for item, i in array
          if i < array.length - 1
            list += "#{item}, "
          if i == array.length - 1
            list += "and #{item}"
        return list
      else
        console?.error "You either need to pass an array to this function, or you passed an object that isn't an array."
    
    ###
    this function stringifies a number and adds commas into it, like this:
    100000000 -> "100,000,000"
    ###
    numberToStringWithCommas: (num) -> # TODO: come up with a more... succinct name...
      num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    
    ###
    this function converts a number to an English string, like this:
    100000000 -> "one-hundred million"
    ###
    numberToEnglishString: (num) ->
      # some nice class variables for Nerd::readify.numberToEnglishString
      ones = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "eighteen", "nineteen"]
      tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
      scales = ["", "thousand", "million", "billion", "trillion", "quadrillion", "quintillion"]
      
      # Based on code that I found here:
      # <http://www.anujgakhar.com/2014/02/23/converting-number-to-words-with-javascript/>
      number = Math.abs(num)
      return Nerd::readify.recursive.check_negative(num, Nerd::readify.recursive.convert_less_than_hundred number) if number < 100
      return Nerd::readify.recursive.check_negative(num, Nerd::readify.recursive.convert_less_than_thousand number) if number < 1000
      for n in [0..scales.length]
        previousScale = n - 1
        scaleValue = Math.pow(1000, n)
        if scaleValue > number
          previousScaleValue = Math.pow(1000, previousScale)
          numberPart = parseInt(number / previousScaleValue, 10)
          remainder = number - (numberPart * previousScaleValue)
          word = Nerd::readify.recursive.convert_less_than_thousand(numberPart) + " " + scales[previousScale]
          if remainder > 0
            word = word + ", " + Nerd::readify.numberToEnglishString(remainder);
          return Nerd::readify.recursive.check_negative(num, word)