src=src
clone=https://github.com/agrover/rtslib-fb.git
path=doc/latest
GIT_VERSION=`cd $(src) && git describe`


doc: fetch
	sed -i -e "s/GIT_VERSION/$(GIT_VERSION)/" \
		$(src)/rtslib/__init__.py
	epydoc -o $(path) $(src)/rtslib 
	cd $(src) && git checkout -- rtslib/__init__.py

fetch:
	if [ ! -d $(src) ]; then git clone $(clone) $(src); fi
	cd $(src) && git pull
