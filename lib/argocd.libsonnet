local kube = import "../vendor/kube-libsonnet/kube.libsonnet";

{
    Application(name): kube._Object("argoproj.io/v1alpha1", "Application", name) {
        metadata+: {
            namespace: "argocd",
            finalizers: [
                "resources-finalizer.argocd.argoproj.io"
            ],
        },
    },
}