#!/bin/bash

# Configuración
SERVER_USER="ec2-user"
SERVER_IP="54.81.57.12"
DEPLOY_DIR="/var/www/hola-mundo"
SSH_KEY="C:/Users/ferna/Downloads/KEY.pem"

# Copiar los archivos al servidor
echo "Desplegando en el servidor..."
ssh -i $SSH_KEY $SERVER_USER@$SERVER_IP "mkdir -p $DEPLOY_DIR"
scp -i $SSH_KEY -r * $SERVER_USER@$SERVER_IP:$DEPLOY_DIR

# Reiniciar Nginx (si ya está configurado)
ssh -i $SSH_KEY $SERVER_USER@$SERVER_IP "sudo systemctl restart nginx"

echo "Despliegue completado."
