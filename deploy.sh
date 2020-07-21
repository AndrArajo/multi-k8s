docker build -t andrarajo/multi-client:latest -t andrarajo/multi-client:$SHA -f ./client-react/Dockerfile ./client-react
docker build -t andrarajo/multi-server:latest -t andrarajo/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t andrarajo/multi-worker:latest -t andrarajo/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push andrarajo/multi-client:latest
docker push andrarajo/multi-server:latest
docker push andrarajo/multi-worker:latest

docker push andrarajo/multi-client:$SHA
docker push andrarajo/multi-server:$SHA
docker push andrarajo/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=andrarajo/multi-server:$SHA
kubectl set image deployments/client-deployment server=andrarajo/multi-client:$SHA
kubectl set image deployments/worker-deployment server=andrarajo/multi-worker:$SHA