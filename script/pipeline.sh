# a pipeline for dev/prod deployment.
# For the purpose of our task, we're using minikube to setup our environment.

# Build our app image and make it available for deployment inside Minikube. 
#In real life scenario, we'd use an artifact/image registry.
./build_app_img.sh

# Deploy PostgreSQL using Bitnami's helm chart with Prometheus exporter DISABLED. 
# because of a bug with the "key" in the postgres secret and the configured secret path for the exporter, 
# we're not using the exporter sidecar provided by bitnami's helm chart.
./deploy_postgresql.sh

# Deploy REDIS using Bitnami's helm chart with Prometheus exporter enabled.
./deploy_redis.sh

# Deploy Our Rails App using our generated & updated helm chart. Using puma-metrics to expose Prometheus readable metrics.
./deploy_app.sh


## For Monitoring our different services, we'll need to deploy the following

# Deploy Prometheus and PostgreSQL exporter
./deploy_prometheus.sh

# Deploy kube-state-metrics for making k8s metrics available to prometheus
./deploy_kube_state_metrics.sh
