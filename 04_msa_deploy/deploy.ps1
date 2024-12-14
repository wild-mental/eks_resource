# Apply namespace
kubectl apply -f msa_dev_namespace.yaml
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host "--- namespace created ---"

# Apply database
kubectl apply -f msa_dev_db.yaml
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host "--- database created ---"

# Apply main service
kubectl apply -f msa_svc_main.yaml
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host "--- main-svc created ---"

# Apply user service
kubectl apply -f msa_svc_user.yaml
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host "--- user-svc created ---"

# Apply review service
kubectl apply -f msa_svc_review.yaml
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host "--- review-svc created ---"

# Apply ingress-nginx
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host "--- ingress-nginx created ---"

# Apply external name service
kubectl apply -f msa_svc_extname.yaml
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host "--- backend-extname created ---"

# Apply ingress routing
kubectl apply -f msa_dev_ingress.yaml
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host "--- ingress routing created ---"
