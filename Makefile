build:
	cd mkdocs/ && ribbity build ribbity-config.toml

pull:
	cd mkdocs/ && ribbity pull ribbity-config.toml

update: build
	mkdocs gh-deploy
