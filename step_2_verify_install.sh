
# Get the llm-d inference URL
export LLMD_URL=$(oc get llminferenceservice llama-llm-d -o jsonpath='{.status.url}')
echo "llm-d URL: ${LLMD_URL}"

# Test with a simple request
curl ${LLMD_URL}/v1/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "llama-3-1-8b-instruct-fp8",
    "prompt": "San Francisco is a",
    "max_tokens": 50,
    "temperature": 0.7
  }' | jq .