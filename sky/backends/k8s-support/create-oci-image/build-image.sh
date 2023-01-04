#!/bin/bash  
ssh-keygen -q -t ecdsa -f sky-ray
export SKY_RAY_PUBLIC_KEY=`cat sky-ray.pub`

docker build -t sky-container --build-arg SKY_RAY_PUBLIC_KEY="$SKY_RAY_PUBLIC_KEY" image/
