fs = require 'fs'
{exec} = require 'child_process'

appFiles = [
  "para"
  "rect"
  "shoes"
]

clean = ['lib']

task "build", "Build a single 'shoes-app.js' file", ->
  appContents = new Array
  remaining = appFiles.length
  for file, index in appFiles
    do (file, index) ->
      fs.readFile "src/#{file}.coffee", 'utf8', (err, fileContents) ->
        throw err if err
        appContents[index] = fileContents
        process(appContents) if --remaining is 0
  process = (contents) ->
    fs.stat 'lib', (err, stats) ->
      throw err if err? and err.code isnt 'ENOENT'
      if err?
        fs.mkdir 'lib', '0755', (err) ->
          throw err if err
          console.log 'Created lib directory'
          write(contents)
      else
        write(contents)
  write = (contents) ->
    # Write concatenated .coffee file temporarily
    filename = 'shoes-app'
    fs.writeFile "lib/#{filename}.coffee", contents.join('\n\n'), 'utf8', (err) ->
      throw err if err
      exec "coffee --compile lib/#{filename}.coffee", (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr unless stdout + stderr is ""
        # Remove concatenated .coffee file
        fs.unlink "lib/#{filename}.coffee", (err) ->
          throw err if err
          console.log "App compiled to lib/#{filename}.js"

task "clean", "Clean build products", ->
  for file in clean
    do (file) ->
      exec "rm -rf #{file}"
