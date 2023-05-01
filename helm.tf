# module "release" {
#   source  = "terraform-module/release/helm"
#   version = "2.8.0"
#   # insert the 3 required variables here
#   namespace  = "app-namespace"
#   repository =  "https://charts.helm.sh/stable"
#   app = {
#     name          = "jenkins"
#     version       = "1.5.0"
#     chart         = "jenkins"
#     force_update  = true
#     wait          = false
#     recreate_pods = false
#     deploy        = 1
#   }
# }

# resource "helm_release" "nginx" {
#   name       = "nginx-ingress"
#   repository = "https://charts.bitnami.com/bitnami"
#   chart      = "nginx-ingress-controller"
#   version    = "9.1.1"

#   set {
#     name  = "controller.publishService.enabled"
#     value = "true"
#   }
# }
