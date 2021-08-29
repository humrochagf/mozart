.PHONY: server
server:
	poetry run datasette data -m metadata.yml --template-dir templates --static static:static/ --memory

.PHONY: twitter
twitter:
	poetry run twitter-to-sqlite user-timeline data/twitter.db -a auth/twitter.json

.PHONY: twitter-faves
twitter-faves:
	poetry run twitter-to-sqlite favorites data/twitter-faves.db -a auth/twitter.json

.PHONY: index
index:
	poetry run dogsheep-beta index data/dogsheep.db dogsheep.yml

.PHONY: styles
styles:
	npx tailwindcss -i styles/main.css -o static/main.css --watch
