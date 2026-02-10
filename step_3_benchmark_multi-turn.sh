# Create the benchmark job
cat << EOF | oc apply -f-
apiVersion: batch/v1
kind: Job
metadata:
  name: custom-benchmark-llm-d
  namespace: llm-d
spec:
  backoffLimit: 4
  template:
    spec:
      serviceAccountName: default
      restartPolicy: Never
      containers:
        - name: benchmark
          image: quay.io/hayesphilip/multi-turn-benchmark:0.0.1
          args:
            - http://llama-llm-d-kserve-workload-svc.llm-d.svc.cluster.local/llm-d/llama-llm-d/v1
            - --parallel=9
EOF





oc logs -f job/custom-benchmark-llm-d