eksctl create cluster -r ap-southeast-2 -n devops-capstone-cluster -t t2.small
kubectl apply -f deployment.yaml
kubectl apply -f services.yaml