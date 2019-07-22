#!/bin/bash

cd /tmp
wget https://services.gradle.org/distributions/gradle-5.5-bin.zip -P /tmp
unzip -d /opt/gradle /tmp/gradle-*.zip

echo "export GRADLE_HOME=/opt/gradle/gradle-5.5" >> /etc/profile.d/gradle.sh
echo "export PATH=/opt/gradle/gradle-5.5/bin:${PATH}" >> /etc/profile.d/gradle.sh
chmod +x /etc/profile.d/gradle.sh
source /etc/profile.d/gradle.sh

