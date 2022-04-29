package figlet

import (
    "dagger.io/dagger"
	"universe.dagger.io/alpine"
	"universe.dagger.io/docker"
)

#Figlet: {
    // Source with text file
    source: dagger.#FS

    // Filename to use
    filename: string

	_image: alpine.#Build & {
				packages: {
					figlet: {}
				}
			}

	_run: docker.#Run & {
		input: _image.output

        mounts: src: {
            dest: "/home"
            contents: source
        }

        env: FILE: filename
        workdir: "/home"
		command: {
			name: "sh"
			flags: "-c": """
			mkdir -p /tmp/output
			figlet $(cat $FILE) > /tmp/output/$FILE.txt
			"""
		}
        export: directories: "/tmp/output": dagger.#FS
	}
	output: _run.export.directories["/tmp/output"]

}