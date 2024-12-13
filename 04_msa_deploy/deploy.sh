kubectl apply -f msa_dev_namespace.yaml
pid=$!
wait $pid
echo "--- namespace created ---"
kubectl apply -f msa_dev_db.yaml
pid=$!
wait $pid
echo "--- database created ---"
kubectl apply -f msa_svc_main.yaml
pid=$!
wait $pid
echo "--- main-svc created ---"
kubectl apply -f msa_svc_user.yaml
pid=$!
wait $pid
echo "--- user-svc created ---"
kubectl apply -f msa_svc_review.yaml
pid=$!
wait $pid
echo "--- review-svc created ---"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
pid=$!
wait $pid
echo "--- ingress-nginx created ---"
kubectl apply -f msa_svc_extname.yaml
pid=$!
wait $pid
echo "--- backend-extname created ---"
kubectl apply -f msa_dev_ingress.yaml
pid=$!
wait $pid
echo "--- ingress routing created ---"

