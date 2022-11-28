# INSTALL DOCKER
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# INSTALL KinD
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64
install kind-linux-amd64 ~/.local/bin/kind
kind create cluster --name kind-1

# INSTALL k3d (k3s in docker)
wget https://github.com/k3d-io/k3d/releases/download/v5.4.6/k3d-linux-amd64
install k3d-linux-amd64 ~/.local/bin/k3d
k3d cluster create -s3 -a3 test

# INSTALL helm, kubens, kubectx, kubectl, minikube
wget https://get.helm.sh/helm-v3.9.4-linux-amd64.tar.gz
tar xzvf helm-v3.9.4-linux-amd64.tar.gz
install ./linux-amd64/helm ~/.local/bin/helm

wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubens
install kubens ~/.local/bin/
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubectx
install kubectx ~/.local/bin/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install kubectl ~/.local/bin/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 ~/.local/bin/minikube

# INSTALL cosign
https://github.com/sigstore/cosign/releases/download/v1.13.1/cosign-linux-amd64
install cosign-linux-amd64 ~/.local/bin/cosign
