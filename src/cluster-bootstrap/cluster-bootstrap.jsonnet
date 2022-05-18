local kube = import "../../vendor/kube-libsonnet/kube.libsonnet";
local cluster_autoscaler = import 'cluster-autoscaler.libsonnet';

function(repoUrl, targetRevision, region, clusterName, clusterAutoscalerServiceAccountName="")
    kube.List() {
        items: cluster_autoscaler.ClusterAutoscaler(repoUrl, targetRevision, region, clusterName, clusterAutoscalerServiceAccountName)
    }
