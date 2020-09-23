# Rancher-cli2

## Description 
Base on ubuntu:18.04 image, install rancher-cli (rancher-linux-amd64-v2.4.6.tar.gz) and kubectl (v1.19.0) command. It can be used on Rancher-pipline.yaml.

## Image pool
https://hub.docker.com/repository/docker/iiiorg/rancher-cli

## How to use on rancher-pipeline.yaml

<pre><code>
stages:
- name: Use kubectl command in image.
  steps: 
  - runScriptConfig:
      image: iiiorg/rancher-cli:v2.4.6
      shellScript: rancher login ${rancher_url} -t ${rancher_api_token} --skip-verify; rancher kubectl get all
    env:
      rancher_url: 'Rancher_URL'
    envFrom:
    - sourceName: pipeline-api-key
      sourceKey: API_TOKEN
      targetKey: rancher_api_token
</code></pre>
