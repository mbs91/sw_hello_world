cd ../manifests


# helm upgrade if not installed. else, install.
echo "----------Running HELM to DEPLOY PostgreSQL----------"
# helm upgrade -f postgresql_values.yaml postgresql oci://registry-1.docker.io/bitnamicharts/postgresq --install
helm upgrade -f postgresql_values.yaml postgresql bitnami/postgresql --install