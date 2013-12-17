Red [
	Title: "File utility functions"
]

#system [#include %file.reds]

slurp: routine [
	path [string!]

	/local
		buffer  [byte-ptr!]
		file    [integer!]
		size    [integer!]
		content
] [
	file: open (as [c-string!] (string/rs-head path))

	either file = -1 [
		RETURN_NONE
	] [
		size: size? file

		buffer: allocate size + 1
		read file buffer size
		close file

		buffer/size: null-byte
		content: string/load as-c-string buffer (size + 1)
		free buffer

		SET_RETURN(content)
	]
]
