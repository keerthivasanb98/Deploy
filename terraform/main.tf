resource "kubernetes_deployment" "react_app" {
  metadata {
    name = "${var.app_name}-deployment"
    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.app_name
          image = var.image_name

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "react_app_svc" {
  metadata {
    name = "${var.app_name}-service"
  }

  spec {
    selector = {
      app = var.app_name
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
