# Create monitoring namespace if it doesn't exit.
# kubectl create namespace monitoring --dry-run=client -o yaml | kubectl apply -f -

cd ../manifests
helm upgrade -f prometheus_values.yaml prometheus bitnami/prometheus --install

echo "DEPLOYING POSTGRESQL EXPORTER"
# deploy postgres exporter. the bitnami sidecar for postgresql has a bug with the secret file name (/opt/bitnami/postgresql/secrets/password) not matching the password key (postgres-password) in the secret (postgres).
# DATA_SOURCE_PASS_FILE:  /opt/bitnami/postgresql/secrets/password  <-- this is the bug
# should be DATA_SOURCE_PASS_FILE:  /opt/bitnami/postgresql/secrets/postgres-password
# had to deploy an exporter and pass correct secret file name.
kubectl apply -f ../manifests/postgres_exporter.yaml

