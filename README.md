# deployment-waiter (from Rancher-cli2)

## Description 
Base on alpine image and bash, install rancher-cli (rancher-linux-amd64-v2.4.6.tar.gz) and kubectl (v1.19.0) command. It can be used in Rancher-pipline.yaml.

## Image pool
https://hub.docker.com/repository/docker/iiiorg/deployment-waiter

## How to use in rancher-pipeline.yaml

### Rancher-pipeline.yaml
<pre><code>
stages:
- name: This is Deploy stage
  steps:
  - applyAppConfig:
      catalogTemplate: cattle-global-data:iii-dev-charts3-web
      version: 0.4.0
      name: ${CICD_GIT_REPO_NAME}-${CICD_GIT_BRANCH}-serv
  ...
- name: Block until deployment is ready
  steps: 
  -  runScriptConfig:
      image: iiiorg/deployment-waiter:0.0.1
      shellScript: >-
        rancher login ${rancher_url} -t ${rancher_api_token} --skip-verify;
        bash /app/run.sh;
    env:
      namespace: ${CICD_GIT_REPO_NAME}
      deploy_name: ${CICD_GIT_REPO_NAME}-${CICD_GIT_BRANCH}-serv  # As same as the chart release name in deploy stage
    envFrom:
    - sourceName: pipeline-api-key
      sourceKey: API_TOKEN
      targetKey: rancher_api_token
    - sourceName: rancher
      sourceKey: rancher-url
      targetKey: rancher_url
</code></pre>
