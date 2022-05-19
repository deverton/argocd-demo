local argocd = import "../../lib/argocd.libsonnet";

{
    ClusterAutoscaler(repoUrl, targetRevision, region, clusterName, serviceAccountName, iamRoleArn): argocd.Application("cluster-autoscaler") {
        spec+: {
          project: "default",
          source: {
              "repoURL": repoUrl,
              "path": "src/addons/cluster-autoscaler",
              "targetRevision": targetRevision,
              "helm": {
                  "parameters": [
                      {
                          "name": "cluster-autoscaler.awsRegion",
                          "value": region,
                      },
                      {
                          "name": "cluster-autoscaler.rbac.serviceAccount.name",
                          "value": serviceAccountName
                      },
                      {
                          "name": "cluster-autoscaler.autoDiscovery.clusterName",
                          "value": clusterName
                      },
                      {
                          "name": "rbac.serviceAccount.annotations.\"eks.amazonaws.com/role-arn\"",
                          "value": iamRoleArn
                      },
                  ],
              },
          },
          "destination": {
              "server": "https://kubernetes.default.svc",
              "namespace": "kube-system"
          },
          "syncPolicy": {
              "automated": {
                  "prune": true
              },
              "retry": {
                  "limit": 1,
                  "backoff": {
                      "duration": "5s",
                      "factor": 2,
                      "maxDuration": "1m",
                  },
              },
          },
      },
    },
}
