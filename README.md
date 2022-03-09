# Rancher-cli

## Description 
Base on ubuntu:18.04 image, install rancher-cli (rancher-linux-amd64-v2.4.6.tar.gz) and kubectl (v1.19.0) command. It can be used on Rancher-pipline.yaml.

## Image pool
https://hub.docker.com/repository/docker/iiiorg/rancher-cli

## How to use on rancher-pipeline.yaml

### Rancher-pipeline.yaml
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

### Result
<pre><code>
+ rancher login https://xxx.xxx.xxx.xxx/ -t ******** --skip-verify
time="2020-09-23T06:54:17Z" level=info msg="Only 1 project available: Default"
time="2020-09-23T06:54:17Z" level=info msg="Saving config to /root/.rancher/cli.json"
+ rancher kubectl get all
NAME                                             READY   STATUS             RESTARTS   AGE
pod/buildpod.pipeline-p-j79qn-48.1-s9g4g-2lz2h   4/4     Running            0          46s
pod/docker-registry-57fbddc6cc-jfvqg             1/1     Running            1          79d
pod/flask-master-64b5c66ffd-5c9sz                0/1     InvalidImageName   0          23h
pod/flask-master-64dbcd6d9b-7qnn9                1/1     Running            0          45h
pod/jenkins-85b6698dc9-znmjb                     1/1     Running            1          79d
pod/minio-5ccb99b5c7-46smg                       1/1     Running            1          79d
pod/mongo-7c696dd97f-g6prt                       0/1     Pending            0          44h
pod/tequila-6bb4d75569-vgnjj                     0/1     Error              526        44h
</pre></code>
