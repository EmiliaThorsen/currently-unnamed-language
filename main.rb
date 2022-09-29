
def passError(error)
  print error
  exit
end


def parser(file)
  #read file
  fileLines = File.read(file).split("\n")

  #tokenize file
  tokens = Array.new
  for line in 0...fileLines.size
    fileLines[line] = fileLines[line].split()
    fileLines[line] += ["endOfLine"]
    tokens += fileLines[line]
  end
  tokens += ["endOfFile"]
  print tokens, "\n"

  #parser
  parsing = true
  token = 0
  line = 0
  types = ["int", "long", "unsigned", "float", "double"]
  while parsing
    case
    when tokens[token] == "endOfFile"
      parsing = false
      print "end of file", "\n"
    when types.include?(tokens[token])
      type = [tokens[token]]
      while true
        token += 1
        if types.include?(tokens[token])
          type += [tokens[token]]
        else
          break
        end
      end
      if tokens[token].include?("(")
        splitToken = tokens[token].split("(")
        name = splitToken[0]
        inVars = Array.new
        tokens[token] = splitToken[1]
        while true
          if tokens[token] == "endOfLine"
            passError "syntax error, parenthesies not closed at line", line, "\n"
          end
          if tokens[token].include?(")")
            inVars += [tokens[token][0..-2]]
            token += 1
            if tokens[token] != "endOfLine"
              passError "syntax error, things after closing perenthasis at line", line, "\n"
            end
            line +=1
            break
          else
            inVars += [tokens[token]]
            token += 1
          end
        end
        print ["function definition", type, name, inVars], "\n"
      else
        name = tokens[token]
        token += 1
        if tokens[token] == "endOfLine"
          print ["var definition", type, name], "\n"
        else
          if tokens[token] == "="
            token += 1
            value = tokens[token]
            token += 1
            if tokens[token] != "endOfLine"
              passError "syntax error, unexpected content after value at line", line
            end
          end
        end
        print ["var definition", type, name, value], "\n"
      end
    end
    token += 1
  end
end

parser("./test.lang")
