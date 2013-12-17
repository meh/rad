Red/System [
	Title: "File utility functions"
]

; not enough integer types to properly encode this, since I only need the
; size this will be good enough for now
-stat!: alias struct! [
	_1  [integer!]
	_2  [integer!]
	_3  [integer!]
	_4  [integer!]
	_5  [integer!]
	_6  [integer!]
	_7  [integer!]
	_8  [integer!]
	_9  [integer!]
	_10 [integer!]
	_11 [integer!]

	size [integer!]

	_12  [integer!]
	_13 [integer!]
	_14 [integer!]
	_15 [integer!]
	_16 [integer!]
	_17 [integer!]
	_18 [integer!]
	_19 [integer!]
	_20 [integer!]
	_21 [integer!]
]

#define O_RDONLY 0

#import [
	LIBC-file cdecl [
		-open: "open" [
			filename [c-string!]
			flags    [integer!]
			mode     [integer!]

			return: [integer!]
		]

		-read: "read" [
			file   [integer!]
			buffer [byte-ptr!]
			bytes  [integer!]

			return: [integer!]
		]

		-close: "close" [
			file [integer!]

			return: [integer!]
		]

		-stat: "__fxstat" [
			version  [integer!]
			file     [integer!]
			out      [-stat!]

			return: [integer!]
		]
	]
]

open: func [
	filename [c-string!]
	
	return: [integer!]
] [
	-open filename O_RDONLY 0
]

size?: func [
	file [integer!]
	
	return: [integer!]

	/local
		s [-stat!]
] [
	s: declare -stat!
	-stat 3 file s
	s/size
]

read: func [
	file   [integer!]
	buffer [byte-ptr!]
	size   [integer!]
	
	return: [integer!]
] [
	-read file buffer size
]

close: func [
	file [integer!]

	return: [integer!]
] [
	-close file
]
