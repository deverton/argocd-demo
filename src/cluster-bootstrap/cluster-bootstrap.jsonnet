local cluster_autoscaler = import 'cluster-autoscaler.libsonnet';

function(repoUrl="https://github.com/deverton/argocd-demo", targetRevision="HEAD", region="us-west-2", clusterName="", clusterAutoscalerServiceAccountName="") [
    cluster_autoscaler.ClusterAutoscaler(repoUrl, targetRevision, region, clusterName, clusterAutoscalerServiceAccountName)
]
