Class {
	#name : #PRTestWithMemoryFileSystem,
	#superclass : #TestCase,
	#instVars : [
		'memoryFileSystem'
	],
	#category : #'Pillar-Tests-ExporterCore-Base'
}

{ #category : #tests }
PRTestWithMemoryFileSystem >> createMicrodownFile1 [
 
	(memoryFileSystem / 'input1.mic') writeStreamDo: [ :stream |
		stream nextPutAll: '### TestFile11

```
some code here
```


### TestFile12

Hey you ...

### TestFile13

You can compile just one chapter with the command `pillar build pdf book-result/chapterPathAndName.format`

### TestFile14
What are you thinking about !!!??

'
		 ]
]

{ #category : #tests }
PRTestWithMemoryFileSystem >> createPillarFile1 [
 
	(memoryFileSystem / 'input1.pillar') writeStreamDo: [ :stream |
		stream nextPutAll: '!!! TestFile11

+Pillar logo>figures/pillar.png|width=30+

If you don''t know ''Pillar'', its documentation is *here>https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html*


!!! TestFile12

Hey you ...

!!! TestFile13

The book is generated directly in HTML and LaTeX with the command ==make book==



You can compile just one chapter with the command ==make book-result/chapterPathAndName.format==
For example, for the first chapter in LaTeX: ==make book-result/Chapters/Chapter1/chapter1.tex==


!!! TestFile14
What are you thinking about !!!??

!!! TestFile15
Where are you !!
'
		 ]
]

{ #category : #tests }
PRTestWithMemoryFileSystem >> setUp [
	super setUp.
	memoryFileSystem := FileSystem memory.
	self createPillarFile1.
	self createMicrodownFile1.
]
