#!/usr/bin/env bash

# To be run in scripts dir
# uses yui-compressor, closure compiler and sass :
# download compiler .jar here : https://github.com/google/closure-compiler
# sudo apt install yui-compressor
# sudo apt-get install ruby-full build-essential rubygems
# sudo gem install sass
# if needed :
# sudo gem install rb-inotify
DJANGO_MODALS_DIR=$(dirname $0)/../django_modals
CSSDIR=$DJANGO_MODALS_DIR/static/django_modals/css
JSDIR=$DJANGO_MODALS_DIR/static/django_modals/js

DJANGO_MODALS_SCSS=$CSSDIR/djmodals.scss
DJANGO_MODALS_CSS=$CSSDIR/djmodals.css
DJANGO_MODALS_MIN_CSS=$CSSDIR/djmodals.min.css
DJANGO_MODALS_JS=$JSDIR/djmodals.js
DJANGO_MODALS_MIN_JS=$JSDIR/djmodals.min.js
DJANGO_MODALS_UTILS_JS=$JSDIR/djmodals_utils.js
DJANGO_MODALS_UTILS_MIN_JS=$JSDIR/djmodals_utils.min.js

JS_COMPRESS="java -jar $HOME/bin/closure-compiler.jar --language_out=ECMASCRIPT_2015"
YUI_COMPRESS=yui-compressor
SAAS=/usr/local/bin/sass

if [[ -d $CSSDIR ]]
then
    $SAAS $DJANGO_MODALS_SCSS $DJANGO_MODALS_CSS
    echo "generated : $DJANGO_MODALS_CSS"
    $YUI_COMPRESS $DJANGO_MODALS_CSS -o $DJANGO_MODALS_MIN_CSS
    echo "generated : $DJANGO_MODALS_MIN_CSS"
fi

if [[ -d $JSDIR ]]
then
    $JS_COMPRESS $DJANGO_MODALS_JS > $DJANGO_MODALS_MIN_JS
    echo "generated : $DJANGO_MODALS_MIN_JS"
    cp $JSDIR/util.js $DJANGO_MODALS_UTILS_JS
    echo >> $DJANGO_MODALS_UTILS_JS
    cat $JSDIR/modal.js >> $DJANGO_MODALS_UTILS_JS
    echo "generated : $DJANGO_MODALS_UTILS_JS"
    $JS_COMPRESS $DJANGO_MODALS_UTILS_JS > $DJANGO_MODALS_UTILS_MIN_JS
    echo "generated : $DJANGO_MODALS_UTILS_MIN_JS"
fi