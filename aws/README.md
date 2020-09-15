export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="us-west-2"

https://github.com/hashicorp/learn-terraform-provision-eks-cluster

aws s3api create-bucket --bucket meetup-tfstate \
    --region eu-west-2 \
    --create-bucket-configuration \
    LocationConstraint=eu-west-2


cluster_name="eks_cluster"
aws eks update-kubeconfig --name $cluster_name

kubectl get nodes 

# deploy the yaml file
kubectl apply -f hello-kubernetes.yaml

# get services 
kubectl get services