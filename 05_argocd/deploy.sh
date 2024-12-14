kubectl apply -f argocd_namespace.yaml
pid=$!
wait $pid
echo "--- namespace created ---"
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
pid=$!
wait $pid
echo "--- argocd service created ---"
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
pid=$!
wait $pid
echo "--- argo service type patched ---"
