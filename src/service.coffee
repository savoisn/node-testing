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
		@values=[]
		@indexes=[]
	read: ->
		monindex=@indexes
		file = fs.readFileSync @file
		for line in file.toString().split("\n")
			do (line) ->
				if line.length > 0
					console.log line
					i=0
					for elem in line.split(";")
						#initialize array
						if monindex[i] == undefined
							monindex[i]={}
						monindex[i][elem] = if monindex[i][elem] == undefined then 1 else monindex[i][elem]+1
						i=i+1

		# new lazy(fs.createReadStream(@file)).lines.forEach (line) ->
		# 	line.toString().split(";").forEach (elem,i) ->
		# 		#initialize array
		# 		index = monindex[i]
		# 		if index == undefined
		# 			console.log(i)	
		# 			monindex[i] = []
		# 			index=monindex[i]
		# 		index[elem]=i

		# 		if i > 2
		# 			console.log(elem+" "+i)	


root = exports ? window
root.Task = Task
root.FileReader = FileReader

