local cluster_autoscaler = import 'cluster-autoscaler.libsonnet';

function(repoUrl, targetRevision="HEAD", region, clusterName, clusterAutoscalerServiceAccountName="") {
    cluster_autoscaler: cluster_autoscaler.ClusterAutoscaler(repoUrl, targetRevision, region, clusterName, clusterAutoscalerServiceAccountName)
}
