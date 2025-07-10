# initialising version of the image. needs to be also updated in manifests/hellofresh/charts
ver=1.0.0
cd ..
# echo "----------START MINIKUBE----------"
minikube start
# echo "----------Enable NGINX ingress controller in MiniKube----------"
minikube addons enable ingress
echo "----------Build application image in Minikube----------"
minikube image build -t sw_hello_world:$ver .