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
chmod +x ./kind 
sudo mv ./kind /usr/local/bin/


# INSTALL helm, kubens, kubectx, kubectl
wget https://get.helm.sh/helm-v3.9.4-linux-amd64.tar.gz
tar xzvf helm-v3.9.4-linux-amd64.tar.gz
sudo mv ./linux-amd64/helm /usr/local/bin/

wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubens
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubectx
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"


# TEST
sudo kind create cluster --name kind-1
sudo docker ps
