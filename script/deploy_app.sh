echo
echo $(pwd)
cd ../manifests/sw-hello-world
echo $(pwd)

# helm upgrade if not installed. else, install.
echo "----------Running HELM to DEPLOY----------"
helm upgrade sw-hello-world . --install