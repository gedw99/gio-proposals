print:

dep:
	git clone https://github.com/egonelbre/expgio


run-async:
	# forvever grid In vertical and horizontal direction. 
	# impressive. Cant think of a UX use case.
	cd expgio/async-loading && go run .

run-flow:
	# lays our ERD stle diagram.
	cd expgio/flow && go run .

run-panels:
	# lays out vertical panels. not that useful. Does not resize.
	cd expgio/panels && go run .

run-surface:
	# lays out a grid view of squares. Does not resize.
	# useful as a first screen to pick recent projects.
	cd expgio/surface && go run .


run-image:
	# loads an image and then gives toggles to position the image.
	# Does resize
	# Quite a good lib for image layout within any container.
	# uses the backed in Fit and Position properties of any GIO widget. Quite nice.
	cd expgio/image-scaling && go run .


run-wrap:
	# lays out grid with latter for each box. Does resize.
	cd expgio/wrap && go run .

run-wrap-exact:
	# lays out grid with latter for each boxwith exact size per box. Does resize.
	cd expgio/wrapexact && go run .


run-lines:
	# animation of shape. Wow.
	cd expgio/too-many-lines && go run .

run-rects:
	# animation ( i guess) of pixel like reactangle.
	cd expgio/too-many-rects && go run .
