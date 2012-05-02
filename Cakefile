fs = require 'fs'
{exec} = require 'child_process'

appFiles = [
  "para"
  "rect"
  "shoes"
]

task "build", "Build a single 'shoes-app.js' file", ->
  div = "\n*********************\n"
  appContents = new Array
  remaining = appFiles.length
  for file, index in appFiles
    do (file, index) ->
      fs.readFile "src/#{file}.coffee", 'utf8', (err, fileContents) ->
        throw err if err
        appContents[index] = fileContents
        process(appContents) if --remaining is 0
  process = (contents) ->
    console.log "Processing: #{contents}"
    fs.writeFile 'lib/shoes-app.coffee', contents.join('\n\n'), 'utf8', (err) ->
      throw err if err
      exec 'coffee --compile lib/shoes-app.coffee', (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr
        fs.unlink 'lib/shoes-app.coffee', (err) ->
        throw err if err
        console.log 'App monolithically compiled to lib/shoes-app.js'
