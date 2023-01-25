set -e

VERSION=$(grep version src/manifest.yaml | grep -o "\d*\.\d*\.\d*")

# Figure out the archive name
ARCHIVE=vendor--app--${VERSION}.zip

# Delete anything that might already be here
rm -f $ARCHIVE

# Create a new zip archive
(
    cd src
    zip -r ../$ARCHIVE \
	manifest.yaml \
	actions \
	alerts \
	queries \
	parsers \
	dashboards \
	scheduled-searches \
	README.md
)

echo Created package $ARCHIVE