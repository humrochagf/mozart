.PHONY: index
index:
	cd data/ && dogsheep-beta index dogsheep.db ../dogsheep.yml

.PHONY: server
server:
	datasette data -m metadata.yml --template-dir ui/templates --static static:ui/static/ --memory

.PHONY: twitter
twitter:
	twitter-to-sqlite user-timeline data/twitter.db -a auth/twitter.json
	twitter-to-sqlite favorites data/twitter-faves.db -a auth/twitter.json

.PHONY: github
github:
	github-to-sqlite starred -a auth/github.js data/github.db humrochagf

.PHONY: styles
styles:
	npx tailwindcss -i ui/styles/main.css -o ui/static/css/main.css --watch
