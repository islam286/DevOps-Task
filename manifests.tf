resource "kubectl_manifest" "web_app_deployment" {
  yaml_body = file("./kubernetes_manifests/web_app_manifest.yaml")
}

resource "kubectl_manifest" "web_app_service" {
  yaml_body = file("./kubernetes_manifests/web_app_service.yaml")
}

resource "kubectl_manifest" "sqlserver_statefulset" {
  yaml_body = file("./kubernetes_manifests/sqlserver_statefulset.yaml")
}

resource "kubectl_manifest" "sqlserver_service" {
  yaml_body = file("./kubernetes_manifests/sqlserver_service.yaml")
}
resource "kubectl_manifest" "redis_statefulset" {
  yaml_body = file("./kubernetes_manifests/redis_statefulset.yaml")
}

resource "kubectl_manifest" "redis_service" {
  yaml_body = file("./kubernetes_manifests/redis_service.yaml")
}

resource "kubectl_manifest" "mongodb_statefulset" {
  yaml_body = file("./kubernetes_manifests/mongodb_statefulset.yaml")
}
resource "kubectl_manifest" "mongodb_service" {
  yaml_body = file("./kubernetes_manifests/mongodb_service.yaml")
}
