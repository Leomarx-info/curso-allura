https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md


# Abrir um terminal e executar os seguintes comandos
- kubectl apply -f 01-dashboard.yaml
- kubectl apply -f 02-service-account.yaml
- kubectl get pods -n kubernetes-dashboard
-kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
- kubectl proxy
# Abrir no browser o seguinte endereço
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.




