#! /bin/bash

# Cleanup folder
rm -rf assets

# Recreate folder
mkdir -p assets/website/

# Compile JS
browserify src/js/core/index.js | uglifyjs -mc > assets/website/gitbook.js
browserify src/js/theme/index.js | uglifyjs -mc > assets/website/theme.js

# Compile Website CSS
lessc -clean-css src/less/website.less assets/website/style.css

# Copy fonts
mkdir -p assets/website/fonts
cp -R node_modules/font-awesome/fonts/ assets/website/fonts/fontawesome/

# Copy icons
mkdir -p assets/website/images
cp node_modules/gitbook-logos/output/favicon.ico assets/website/images/
cp node_modules/gitbook-logos/output/apple-touch-icon-152.png assets/website/images/apple-touch-icon-precomposed-152.png