#add Repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Install kube-state-metrics, if not installed
helm upgrade kube-state-metrics prometheus-community/kube-state-metrics --install