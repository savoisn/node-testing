#FileReader = require '../src/service'
{Task, FileReader} = require '../src/service'

describe 'Task instance', ->
    task1 = task2 = null
    it 'should not fail', ->
        name='feed the cat'
        name.should.equal 'feed the cat'
    it 'should have a name', ->
        task1 = new Task 'feed the cat'
        task1.name.should.equal 'feed the cat'
	it 'should be initially incomplete', ->
		task1 = new Task 'feed the cat'
		task1.status.should.equal 'incomplete'
	it 'should be able to be completed', ->
		task1 = new Task 'feed the cat'
		task1.complete().should.be.true
		task1.status.should.equal 'complete'

describe 'FileReader', ->
	beforeEach ->
	it 'should have a file', ->
		fileReader = new FileReader 'csv.csv'
		fileReader.file.should.equal 'csv.csv'
	it 'should log the file content', ->
		fileReader = new FileReader 'csv.csv'
		fileReader.read()
		console.log fileReader.indexes