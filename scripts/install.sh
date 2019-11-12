#!/bin/bash
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update
sudo apt-get install -y openjdk-8-jdk \
    jenkins \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

apt-cache policy docker-ce
sudo apt-get install -y docker-ce

sudo tee /etc/docker/daemon.json  <<EOF
{
  "features": {
    "buildkit": true
  }
}
EOF

sudo usermod -a -G docker jenkins
sudo systemctl enable docker
sudo systemctl restart docker

sudo ufw allow 8080
sudo systemctl enable jenkins
sudo systemctl restart jenkins

# Unlock Jenkins
while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]
do
  sleep 1
done
sudo cat /var/lib/jenkins/secrets/initialAdminPassword