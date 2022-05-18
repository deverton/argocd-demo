local cluster_autoscaler = import 'cluster-autoscaler.libsonnet';

function(repoUrl, targetRevision, region, clusterName, clusterAutoscalerServiceAccountName="") [
    cluster_autoscaler.ClusterAutoscaler(repoUrl, targetRevision, region, clusterName, clusterAutoscalerServiceAccountName)
]
