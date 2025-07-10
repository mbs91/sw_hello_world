cd ../manifests/


# helm upgrade if not installed. else, install.
echo "----------Running HELM to DEPLOY Redis----------"
# helm upgrade -f redis_values.yaml redis oci://registry-1.docker.io/bitnamicharts/redis --install
helm upgrade -f redis_values.yaml redis bitnami/redis --install