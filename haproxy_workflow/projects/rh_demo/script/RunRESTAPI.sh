#!/bin/bash

echo '發送 POST 請求以獲取 OAuth token'

TOKEN=$(curl -s -k -i -L -X GET --user kubeadmin:Zd3AF-EFwFS-UG6bx-ScfIX 'https://oauth-openshift.apps.palsys.eastus.aroapp.io/oauth/authorize?response_type=token&client_id=openshift-challenging-client' | grep -oP "access_token=\K[^&]*")

echo ' 使用OAuth token向 OpenShift 的 REST API 發送請求'
#創建project
curl -k -X POST -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" https://api.palsys.eastus.aroapp.io:6443/api/v1/namespaces -d '{"kind":"Namespace","apiVersion":"v1","metadata":{"name":"webservice-demo"}}'

#在project底下建立pod
curl -k -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/yaml" -X POST --data-binary "@yaml/pod.yaml" "https://api.palsys.eastus.aroapp.io:6443/api/v1/namespaces/webservice-demo/pods"

#在project底下建立Service
curl -k -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/yaml" -X POST --data-binary "@yaml/service.yaml" "https://api.palsys.eastus.aroapp.io:6443/api/v1/namespaces/webservice-demo/services"

#在project底下建立route
curl -k -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/yaml" -X POST --data-binary "@yaml/route.yaml" "https://api.palsys.eastus.aroapp.io:6443/apis/route.openshift.io/v1/namespaces/webservice-demo/routes"

echo '取得pod資訊'

curl -X GET -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" https://api.palsys.eastus.aroapp.io:6443/api/v1/namespaces/webservice-demo/pods/my-pod | grep -E '"phase"'

echo '取得URL資訊'

curl -k -s -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" https://api.palsys.eastus.aroapp.io:6443/apis/route.openshift.io/v1/namespaces/webservice-demo/routes/my-pod-route | jq -r '.spec.host'


