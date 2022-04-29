package test

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"
	"figlet@example.com/figlet"
)

dagger.#Plan & {

	client: filesystem: ".": read: contents:         dagger.#FS
	client: filesystem: "./output": write: contents: actions.build.figlet.output
	
	actions: {
		load: {
			sources:     client.filesystem.".".read.contents
			_loadSource: core.#Source & {
				path: "./src"
			}
            figletSource: _loadSource.output
		}
		figlet: figlet.#Figlet & {
			source: load.figletSource
			filename: "dagger"
		}
	}
}
