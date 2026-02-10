oc apply -k monitoring

# Wait for Grafana to be ready
oc wait --for=condition=ready pod -l app=grafana -n llm-d-monitoring --timeout=300s

# Get Grafana URL
export GRAFANA_URL=$(oc get route grafana-secure -n llm-d-monitoring -o jsonpath='{.spec.host}')
echo "Grafana URL: https://$GRAFANA_URL"