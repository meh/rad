Red [
	Title: "The Red project manager"
]

rad: context [
	file: context [#include %rad/file.red]

	import: func [descriptor] [
		print descriptor
	]
]

print rad/file/slurp %rad.red
