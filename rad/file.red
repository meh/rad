Red [
	Title: "File utility functions"
]

#system [
	file: context [
		#include %file.reds
	]
]

slurp: routine [
	path [string!]

	/local
		buffer  [byte-ptr!]
		fd      [integer!]
		size    [integer!]
		content
] [
	fd: file/open (as [c-string!] (string/rs-head path))

	if fd < 0 [
		RETURN_NONE
	]

	size: file/size? fd

	buffer: allocate size + 1
	file/read fd buffer size
	file/close file

	buffer/size: null-byte
	content: string/load as-c-string buffer (size + 1)
	free buffer

	SET_RETURN (content)
]
