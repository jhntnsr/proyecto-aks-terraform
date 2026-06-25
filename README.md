# proyecto-aks-terraform
Proyecto, soluciones integradas en la nube
Proyecto de Infraestructura en la Nube con Terraform y AKS
Este proyecto demuestra la automatización del despliegue de un clúster de Azure Kubernetes Service (AKS) utilizando Terraform como herramienta de Infraestructura como Código (IaC). Además, se despliega una aplicación web de prueba (Nginx) para validar la conectividad y el balanceo de carga en un entorno de contenedores gestionado.

Descripción del Proyecto
El objetivo es implementar una infraestructura escalable en Microsoft Azure. El proceso sigue las mejores prácticas de DevOps, eliminando la configuración manual a través de la automatización completa:

Terraform: Provisión de Resource Group y clúster AKS.

Azure CLI: Gestión de credenciales y contexto del clúster.

Kubernetes (kubectl): Orquestación de despliegues y servicios mediante archivos YAML.

Tecnologías Utilizadas
Azure Cloud Shell: Entorno de ejecución en la nube.

Terraform: Automatización de infraestructura.

Azure Kubernetes Service (AKS): Orquestador de contenedores.

Kubernetes (kubectl): Gestión de despliegue de aplicaciones.

Nginx: Aplicación web de prueba.

Requisitos Previos
Cuenta de Azure con suscripción activa.

Créditos de Azure (el entorno se destruye al finalizar para optimizar costos).

Instrucciones de Despliegue
Inicialización de Terraform:

terraform init
Construcción de Infraestructura:

terraform apply -auto-approve
Conexión al Clúster:

az aks get-credentials --resource-group mi-aks-recursos --name mi-cluster-aks-v2
Despliegue de la Aplicación:

kubectl apply -f nginx-app.yaml
Verificación:

kubectl get services --watch

Limpieza (Importante)
Para evitar cargos inesperados en tu suscripción de Azure, siempre destruye los recursos tras finalizar las pruebas:

terraform destroy -auto-approve
