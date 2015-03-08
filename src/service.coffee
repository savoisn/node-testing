fs = require 'fs'
lazy = require 'lazy'

class Task
	constructor: (@name) ->
		@status = 'incomplete'
	
	complete: ->
		@status = 'complete'
		true

class FileReader
	constructor: (@file) ->

	read: ->
		new lazy(fs.createReadStream(@file)).lines.forEach (line) ->
			line.toString().split(";").forEach (elem,i) ->
				if i > 2
					console.log(elem+" "+i)	


root = exports ? window
root.Task = Task
root.FileReader = FileReader

